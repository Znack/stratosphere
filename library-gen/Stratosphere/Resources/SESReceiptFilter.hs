{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ses-receiptfilter.html

module Stratosphere.Resources.SESReceiptFilter where

import Stratosphere.ResourceImports
import Stratosphere.ResourceProperties.SESReceiptFilterFilter

-- | Full data type definition for SESReceiptFilter. See 'sesReceiptFilter'
-- for a more convenient constructor.
data SESReceiptFilter =
  SESReceiptFilter
  { _sESReceiptFilterFilter :: SESReceiptFilterFilter
  } deriving (Show, Eq)

instance ToJSON SESReceiptFilter where
  toJSON SESReceiptFilter{..} =
    object $
    catMaybes
    [ (Just . ("Filter",) . toJSON) _sESReceiptFilterFilter
    ]

instance FromJSON SESReceiptFilter where
  parseJSON (Object obj) =
    SESReceiptFilter <$>
      (obj .: "Filter")
  parseJSON _ = mempty

-- | Constructor for 'SESReceiptFilter' containing required fields as
-- arguments.
sesReceiptFilter
  :: SESReceiptFilterFilter -- ^ 'sesrfFilter'
  -> SESReceiptFilter
sesReceiptFilter filterarg =
  SESReceiptFilter
  { _sESReceiptFilterFilter = filterarg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ses-receiptfilter.html#cfn-ses-receiptfilter-filter
sesrfFilter :: Lens' SESReceiptFilter SESReceiptFilterFilter
sesrfFilter = lens _sESReceiptFilterFilter (\s a -> s { _sESReceiptFilterFilter = a })
