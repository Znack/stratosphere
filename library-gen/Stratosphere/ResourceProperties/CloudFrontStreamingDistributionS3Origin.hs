{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cloudfront-streamingdistribution-s3origin.html

module Stratosphere.ResourceProperties.CloudFrontStreamingDistributionS3Origin where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values


-- | Full data type definition for CloudFrontStreamingDistributionS3Origin.
-- See 'cloudFrontStreamingDistributionS3Origin' for a more convenient
-- constructor.
data CloudFrontStreamingDistributionS3Origin =
  CloudFrontStreamingDistributionS3Origin
  { _cloudFrontStreamingDistributionS3OriginDomainName :: Val Text
  , _cloudFrontStreamingDistributionS3OriginOriginAccessIdentity :: Val Text
  } deriving (Show, Eq)

instance ToJSON CloudFrontStreamingDistributionS3Origin where
  toJSON CloudFrontStreamingDistributionS3Origin{..} =
    object $
    catMaybes
    [ (Just . ("DomainName",) . toJSON) _cloudFrontStreamingDistributionS3OriginDomainName
    , (Just . ("OriginAccessIdentity",) . toJSON) _cloudFrontStreamingDistributionS3OriginOriginAccessIdentity
    ]

instance FromJSON CloudFrontStreamingDistributionS3Origin where
  parseJSON (Object obj) =
    CloudFrontStreamingDistributionS3Origin <$>
      (obj .: "DomainName") <*>
      (obj .: "OriginAccessIdentity")
  parseJSON _ = mempty

-- | Constructor for 'CloudFrontStreamingDistributionS3Origin' containing
-- required fields as arguments.
cloudFrontStreamingDistributionS3Origin
  :: Val Text -- ^ 'cfsdsoDomainName'
  -> Val Text -- ^ 'cfsdsoOriginAccessIdentity'
  -> CloudFrontStreamingDistributionS3Origin
cloudFrontStreamingDistributionS3Origin domainNamearg originAccessIdentityarg =
  CloudFrontStreamingDistributionS3Origin
  { _cloudFrontStreamingDistributionS3OriginDomainName = domainNamearg
  , _cloudFrontStreamingDistributionS3OriginOriginAccessIdentity = originAccessIdentityarg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cloudfront-streamingdistribution-s3origin.html#cfn-cloudfront-streamingdistribution-s3origin-domainname
cfsdsoDomainName :: Lens' CloudFrontStreamingDistributionS3Origin (Val Text)
cfsdsoDomainName = lens _cloudFrontStreamingDistributionS3OriginDomainName (\s a -> s { _cloudFrontStreamingDistributionS3OriginDomainName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cloudfront-streamingdistribution-s3origin.html#cfn-cloudfront-streamingdistribution-s3origin-originaccessidentity
cfsdsoOriginAccessIdentity :: Lens' CloudFrontStreamingDistributionS3Origin (Val Text)
cfsdsoOriginAccessIdentity = lens _cloudFrontStreamingDistributionS3OriginOriginAccessIdentity (\s a -> s { _cloudFrontStreamingDistributionS3OriginOriginAccessIdentity = a })