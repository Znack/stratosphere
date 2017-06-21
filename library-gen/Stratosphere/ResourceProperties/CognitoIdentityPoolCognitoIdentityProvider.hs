{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cognito-identitypool-cognitoidentityprovider.html

module Stratosphere.ResourceProperties.CognitoIdentityPoolCognitoIdentityProvider where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values


-- | Full data type definition for CognitoIdentityPoolCognitoIdentityProvider.
-- See 'cognitoIdentityPoolCognitoIdentityProvider' for a more convenient
-- constructor.
data CognitoIdentityPoolCognitoIdentityProvider =
  CognitoIdentityPoolCognitoIdentityProvider
  { _cognitoIdentityPoolCognitoIdentityProviderClientId :: Maybe (Val Text)
  , _cognitoIdentityPoolCognitoIdentityProviderProviderName :: Maybe (Val Text)
  , _cognitoIdentityPoolCognitoIdentityProviderServerSideTokenCheck :: Maybe (Val Bool')
  } deriving (Show, Eq)

instance ToJSON CognitoIdentityPoolCognitoIdentityProvider where
  toJSON CognitoIdentityPoolCognitoIdentityProvider{..} =
    object $
    catMaybes
    [ ("ClientId" .=) <$> _cognitoIdentityPoolCognitoIdentityProviderClientId
    , ("ProviderName" .=) <$> _cognitoIdentityPoolCognitoIdentityProviderProviderName
    , ("ServerSideTokenCheck" .=) <$> _cognitoIdentityPoolCognitoIdentityProviderServerSideTokenCheck
    ]

instance FromJSON CognitoIdentityPoolCognitoIdentityProvider where
  parseJSON (Object obj) =
    CognitoIdentityPoolCognitoIdentityProvider <$>
      obj .:? "ClientId" <*>
      obj .:? "ProviderName" <*>
      obj .:? "ServerSideTokenCheck"
  parseJSON _ = mempty

-- | Constructor for 'CognitoIdentityPoolCognitoIdentityProvider' containing
-- required fields as arguments.
cognitoIdentityPoolCognitoIdentityProvider
  :: CognitoIdentityPoolCognitoIdentityProvider
cognitoIdentityPoolCognitoIdentityProvider  =
  CognitoIdentityPoolCognitoIdentityProvider
  { _cognitoIdentityPoolCognitoIdentityProviderClientId = Nothing
  , _cognitoIdentityPoolCognitoIdentityProviderProviderName = Nothing
  , _cognitoIdentityPoolCognitoIdentityProviderServerSideTokenCheck = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cognito-identitypool-cognitoidentityprovider.html#cfn-cognito-identitypool-cognitoidentityprovider-clientid
cipcipClientId :: Lens' CognitoIdentityPoolCognitoIdentityProvider (Maybe (Val Text))
cipcipClientId = lens _cognitoIdentityPoolCognitoIdentityProviderClientId (\s a -> s { _cognitoIdentityPoolCognitoIdentityProviderClientId = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cognito-identitypool-cognitoidentityprovider.html#cfn-cognito-identitypool-cognitoidentityprovider-providername
cipcipProviderName :: Lens' CognitoIdentityPoolCognitoIdentityProvider (Maybe (Val Text))
cipcipProviderName = lens _cognitoIdentityPoolCognitoIdentityProviderProviderName (\s a -> s { _cognitoIdentityPoolCognitoIdentityProviderProviderName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cognito-identitypool-cognitoidentityprovider.html#cfn-cognito-identitypool-cognitoidentityprovider-serversidetokencheck
cipcipServerSideTokenCheck :: Lens' CognitoIdentityPoolCognitoIdentityProvider (Maybe (Val Bool'))
cipcipServerSideTokenCheck = lens _cognitoIdentityPoolCognitoIdentityProviderServerSideTokenCheck (\s a -> s { _cognitoIdentityPoolCognitoIdentityProviderServerSideTokenCheck = a })
