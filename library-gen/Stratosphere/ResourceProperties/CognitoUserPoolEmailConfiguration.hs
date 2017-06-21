{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cognito-userpool-emailconfiguration.html

module Stratosphere.ResourceProperties.CognitoUserPoolEmailConfiguration where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values


-- | Full data type definition for CognitoUserPoolEmailConfiguration. See
-- 'cognitoUserPoolEmailConfiguration' for a more convenient constructor.
data CognitoUserPoolEmailConfiguration =
  CognitoUserPoolEmailConfiguration
  { _cognitoUserPoolEmailConfigurationReplyToEmailAddress :: Maybe (Val Text)
  , _cognitoUserPoolEmailConfigurationSourceArn :: Maybe (Val Text)
  } deriving (Show, Eq)

instance ToJSON CognitoUserPoolEmailConfiguration where
  toJSON CognitoUserPoolEmailConfiguration{..} =
    object $
    catMaybes
    [ ("ReplyToEmailAddress" .=) <$> _cognitoUserPoolEmailConfigurationReplyToEmailAddress
    , ("SourceArn" .=) <$> _cognitoUserPoolEmailConfigurationSourceArn
    ]

instance FromJSON CognitoUserPoolEmailConfiguration where
  parseJSON (Object obj) =
    CognitoUserPoolEmailConfiguration <$>
      obj .:? "ReplyToEmailAddress" <*>
      obj .:? "SourceArn"
  parseJSON _ = mempty

-- | Constructor for 'CognitoUserPoolEmailConfiguration' containing required
-- fields as arguments.
cognitoUserPoolEmailConfiguration
  :: CognitoUserPoolEmailConfiguration
cognitoUserPoolEmailConfiguration  =
  CognitoUserPoolEmailConfiguration
  { _cognitoUserPoolEmailConfigurationReplyToEmailAddress = Nothing
  , _cognitoUserPoolEmailConfigurationSourceArn = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cognito-userpool-emailconfiguration.html#cfn-cognito-userpool-emailconfiguration-replytoemailaddress
cupecReplyToEmailAddress :: Lens' CognitoUserPoolEmailConfiguration (Maybe (Val Text))
cupecReplyToEmailAddress = lens _cognitoUserPoolEmailConfigurationReplyToEmailAddress (\s a -> s { _cognitoUserPoolEmailConfigurationReplyToEmailAddress = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cognito-userpool-emailconfiguration.html#cfn-cognito-userpool-emailconfiguration-sourcearn
cupecSourceArn :: Lens' CognitoUserPoolEmailConfiguration (Maybe (Val Text))
cupecSourceArn = lens _cognitoUserPoolEmailConfigurationSourceArn (\s a -> s { _cognitoUserPoolEmailConfigurationSourceArn = a })
