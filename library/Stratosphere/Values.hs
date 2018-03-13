{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Stratosphere.Values
  ( Val (..)
  , sub
  , ValList (..)
  , Integer' (..)
  , Bool' (..)
  , Double' (..)
  , ToRef (..)
  ) where

import Data.Aeson
import Data.HashMap.Strict (HashMap)
import qualified Data.HashMap.Strict as HM
import Data.String (IsString (..))
import Data.Text (Text)
import Text.Read (readMaybe)
import GHC.Exts (IsList(..))

-- GADTs are cool, but I couldn't get this to work with FromJSON
-- data Val a where
--   Literal :: a -> Val a
--   Ref :: Text -> Val a
--   If :: Text -> Val a -> Val a -> Val a
--   And :: Val Bool -> Val Bool -> Val Bool
--   Equals :: (Show a, ToJSON a) => Val a -> Val a -> Val Bool
--   Or :: Val Bool -> Val Bool -> Val Bool

-- | This type is a wrapper around any values in a template. A value can be a
-- 'Literal', a 'Ref', or an intrinsic function. See:
-- http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference.html
data Val a
 = Literal a
 | Ref Text
 | If Text (Val a) (Val a)
 | Equals (Val a) (Val a)
 | And (Val Bool) (Val Bool)
 | Or (Val Bool) (Val Bool)
 | Not (Val Bool)
 | GetAtt Text Text
 | Base64 (Val Text)
 | Join Text (ValList Text)
 | Select Integer (ValList a)
 | FindInMap (Val a) (Val a) (Val a) -- ^ Map name, top level key, and second level key
 | ImportValue Text -- ^ The account-and-region-unique exported name of the value to import
 | Sub Text (Maybe (HashMap Text (Val Text))) -- ^ Substitution string and optional map of values

deriving instance (Show a) => Show (Val a)
deriving instance (Eq a) => Eq (Val a)
deriving instance Functor Val

instance (IsString a) => IsString (Val a) where
  fromString s = Literal (fromString s)

instance (ToJSON a) => ToJSON (Val a) where
  toJSON (Literal v) = toJSON v
  toJSON (Ref r) = refToJSON r
  toJSON (If i x y) = mkFunc "Fn::If" [toJSON i, toJSON x, toJSON y]
  toJSON (Equals x y) = mkFunc "Fn::Equals" [toJSON x, toJSON y]
  toJSON (And x y) = mkFunc "Fn::And" [toJSON (Bool' <$> x), toJSON (Bool' <$> y)]
  toJSON (Or x y) = mkFunc "Fn::Or" [toJSON (Bool' <$> x), toJSON (Bool' <$> y)]
  toJSON (Not v) = mkFunc "Fn::Not" [toJSON (Bool' <$> v)]
  toJSON (GetAtt x y) = mkFunc "Fn::GetAtt" [toJSON x, toJSON y]
  toJSON (Base64 v) = object [("Fn::Base64", toJSON v)]
  toJSON (Join d vs) = mkFunc "Fn::Join" [toJSON d, toJSON vs]
  toJSON (Select i vs) = mkFunc "Fn::Select" [toJSON (Integer' i), toJSON vs]
  toJSON (FindInMap mapName topKey secondKey) =
    object [("Fn::FindInMap", toJSON [toJSON mapName, toJSON topKey, toJSON secondKey])]
  toJSON (ImportValue t) = importValueToJSON t
  toJSON (Sub s Nothing) = object [("Fn::Sub", toJSON s)]
  toJSON (Sub s (Just vals)) = mkFunc "Fn::Sub" [toJSON s, Object (toJSON <$> vals)]

-- | Simple version of 'Sub' without a map of values.
sub :: Text -> Val Text
sub s = Sub s Nothing

refToJSON :: Text -> Value
refToJSON ref = object [("Ref", toJSON ref)]

importValueToJSON :: Text -> Value
importValueToJSON ref = object [("Fn::ImportValue", toJSON ref)]

mkFunc :: Text -> [Value] -> Value
mkFunc name args = object [(name, Array $ fromList args)]

instance (FromJSON a) => FromJSON (Val a) where
  parseJSON (Object o) =
    case HM.toList o of
      [] -> fail "Empty object as Val"
      [("Ref", o')] -> Ref <$> parseJSON o'
      [("Fn::If", o')] -> (\(i, x, y) -> If i x y) <$> parseJSON o'
      [("Fn::Equals", o')] -> uncurry Equals <$> parseJSON o'
      [("Fn::And", o')] -> (\(x, y) -> And (unBool' <$> x) (unBool' <$> y)) <$> parseJSON o'
      [("Fn::Or", o')] -> (\(x, y) -> Or (unBool' <$> x) (unBool' <$> y)) <$> parseJSON o'
      [("Fn::Not", o')] -> Not <$> parseJSON o'
      [("Fn::GetAtt", o')] -> uncurry GetAtt <$> parseJSON o'
      [("Fn::Base64", o')] -> Base64 <$> parseJSON o'
      [("Fn::Join", o')] -> uncurry Join <$> parseJSON o'
      [("Fn::Select", o')] -> (\(x, y) -> Select (unInteger' x) y) <$> parseJSON o'
      [("Fn::FindInMap", o')] -> do
        (mapName, topKey, secondKey) <- parseJSON o'
        return (FindInMap mapName topKey secondKey)
      [("Fn::ImportValue", o')] -> ImportValue <$> parseJSON o'
      [("Fn::Sub", vals)] ->
        case vals of
          (String s) -> return $ Sub s Nothing
          otherwise' -> uncurry Sub <$> parseJSON otherwise'
      [(n, o')] -> Literal <$> parseJSON (object [(n, o')])
      os -> Literal <$> parseJSON (object os)
  parseJSON v = Literal <$> parseJSON v

-- | 'ValList' is like 'Val', except it is used in place of lists of Vals in
-- templates. For example, if you have a parameter called @SubnetIds@ of type
-- @List<AWS::EC2::Subnet::Id>@ then, you can use @RefList "SubnetIds"@ to
-- reference it.
data ValList a
  = ValList [Val a]
  | RefList Text
  | ImportValueList Text
  | Split Text (Val a)
  | GetAZs (Val Text)
  deriving (Show, Eq)

deriving instance Functor ValList

instance IsList (ValList a) where
  type Item (ValList a) = Val a
  fromList = ValList

  toList (ValList xs) = xs
  -- This is obviously not meaningful, but the IsList instance is so useful
  -- that I decided to allow it.
  toList (RefList _) = []
  toList (ImportValueList _) = []
  toList (Split _ _) = []
  toList (GetAZs _) = []

instance (ToJSON a) => ToJSON (ValList a) where
  toJSON (ValList vals) = toJSON vals
  toJSON (RefList ref) = refToJSON ref
  toJSON (ImportValueList ref) = importValueToJSON ref
  toJSON (Split d s) = mkFunc "Fn::Split" [toJSON d, toJSON s]
  toJSON (GetAZs r) = object [("Fn::GetAZs", toJSON r)]

instance (FromJSON a) => FromJSON (ValList a) where
  parseJSON a@(Array _) = ValList <$> parseJSON a
  parseJSON (Object o) =
    case HM.toList o of
      [("Ref", o')] -> RefList <$> parseJSON o'
      [("Fn::ImportValue", o')] -> ImportValueList <$> parseJSON o'
      [("Fn::Split", o')] -> uncurry Split <$> parseJSON o'
      [("Fn::GetAZs", o')] -> GetAZs <$> parseJSON o'
      _ -> fail "Could not parse object into RefList"
  parseJSON _ = fail "Expected Array or Object for ValList in parseJSON"

-- | We need to wrap integers so we can override the Aeson type-classes. This
-- is necessary because CloudFront made the silly decision to represent numbers
-- as JSON strings.
newtype Integer' = Integer' { unInteger' :: Integer }
  deriving (Show, Eq, Num)

instance ToJSON Integer' where
  toJSON (Integer' i) = toJSON $ show i

instance FromJSON Integer' where
  parseJSON v = Integer' <$> do
    numString <- parseJSON v
    case readMaybe (numString :: String) of
      Nothing -> fail "Can't read number from string"
      (Just n) -> return n

-- | We need to wrap Bools for the same reason we need to wrap Ints.
newtype Bool' = Bool' { unBool' :: Bool }
  deriving (Show, Bounded, Enum, Eq, Ord)

instance ToJSON Bool' where
  toJSON (Bool' True) = "true"
  toJSON (Bool' False) = "false"

instance FromJSON Bool' where
  parseJSON v = do
    string <- parseJSON v
    case string of
      "true" -> return (Bool' True)
      "false" -> return (Bool' False)
      _ -> fail $ "Unknown bool string " ++ string

-- | Class used to create a 'Ref' from another type.
class ToRef a b where
  toRef :: a -> Val b

-- | We need to wrap Doubles for the same reason we need to wrap Ints.
newtype Double' = Double' { unDouble' :: Double }
  deriving (Show, Eq, Num)

instance ToJSON Double' where
  toJSON (Double' i) = toJSON $ show i

instance FromJSON Double' where
  parseJSON v = Double' <$> do
    numString <- parseJSON v
    case readMaybe (numString :: String) of
      Nothing -> fail "Can't read number from string"
      (Just n) -> return n
