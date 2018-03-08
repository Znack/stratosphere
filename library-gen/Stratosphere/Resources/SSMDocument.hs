{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ssm-document.html

module Stratosphere.Resources.SSMDocument where

import Stratosphere.ResourceImports
import Stratosphere.ResourceProperties.Tag

-- | Full data type definition for SSMDocument. See 'ssmDocument' for a more
-- convenient constructor.
data SSMDocument =
  SSMDocument
  { _sSMDocumentContent :: Object
  , _sSMDocumentDocumentType :: Maybe (Val Text)
  , _sSMDocumentTags :: Maybe [Tag]
  } deriving (Show, Eq)

instance ToJSON SSMDocument where
  toJSON SSMDocument{..} =
    object $
    catMaybes
    [ (Just . ("Content",) . toJSON) _sSMDocumentContent
    , fmap (("DocumentType",) . toJSON) _sSMDocumentDocumentType
    , fmap (("Tags",) . toJSON) _sSMDocumentTags
    ]

instance FromJSON SSMDocument where
  parseJSON (Object obj) =
    SSMDocument <$>
      (obj .: "Content") <*>
      (obj .:? "DocumentType") <*>
      (obj .:? "Tags")
  parseJSON _ = mempty

-- | Constructor for 'SSMDocument' containing required fields as arguments.
ssmDocument
  :: Object -- ^ 'ssmdContent'
  -> SSMDocument
ssmDocument contentarg =
  SSMDocument
  { _sSMDocumentContent = contentarg
  , _sSMDocumentDocumentType = Nothing
  , _sSMDocumentTags = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ssm-document.html#cfn-ssm-document-content
ssmdContent :: Lens' SSMDocument Object
ssmdContent = lens _sSMDocumentContent (\s a -> s { _sSMDocumentContent = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ssm-document.html#cfn-ssm-document-documenttype
ssmdDocumentType :: Lens' SSMDocument (Maybe (Val Text))
ssmdDocumentType = lens _sSMDocumentDocumentType (\s a -> s { _sSMDocumentDocumentType = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ssm-document.html#cfn-ssm-document-tags
ssmdTags :: Lens' SSMDocument (Maybe [Tag])
ssmdTags = lens _sSMDocumentTags (\s a -> s { _sSMDocumentTags = a })
