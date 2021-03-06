{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-volumes.html

module Stratosphere.ResourceProperties.ECSTaskDefinitionVolume where

import Stratosphere.ResourceImports
import Stratosphere.ResourceProperties.ECSTaskDefinitionHostVolumeProperties

-- | Full data type definition for ECSTaskDefinitionVolume. See
-- 'ecsTaskDefinitionVolume' for a more convenient constructor.
data ECSTaskDefinitionVolume =
  ECSTaskDefinitionVolume
  { _eCSTaskDefinitionVolumeHost :: Maybe ECSTaskDefinitionHostVolumeProperties
  , _eCSTaskDefinitionVolumeName :: Maybe (Val Text)
  } deriving (Show, Eq)

instance ToJSON ECSTaskDefinitionVolume where
  toJSON ECSTaskDefinitionVolume{..} =
    object $
    catMaybes
    [ fmap (("Host",) . toJSON) _eCSTaskDefinitionVolumeHost
    , fmap (("Name",) . toJSON) _eCSTaskDefinitionVolumeName
    ]

instance FromJSON ECSTaskDefinitionVolume where
  parseJSON (Object obj) =
    ECSTaskDefinitionVolume <$>
      (obj .:? "Host") <*>
      (obj .:? "Name")
  parseJSON _ = mempty

-- | Constructor for 'ECSTaskDefinitionVolume' containing required fields as
-- arguments.
ecsTaskDefinitionVolume
  :: ECSTaskDefinitionVolume
ecsTaskDefinitionVolume  =
  ECSTaskDefinitionVolume
  { _eCSTaskDefinitionVolumeHost = Nothing
  , _eCSTaskDefinitionVolumeName = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-volumes.html#cfn-ecs-taskdefinition-volumes-host
ecstdvHost :: Lens' ECSTaskDefinitionVolume (Maybe ECSTaskDefinitionHostVolumeProperties)
ecstdvHost = lens _eCSTaskDefinitionVolumeHost (\s a -> s { _eCSTaskDefinitionVolumeHost = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-volumes.html#cfn-ecs-taskdefinition-volumes-name
ecstdvName :: Lens' ECSTaskDefinitionVolume (Maybe (Val Text))
ecstdvName = lens _eCSTaskDefinitionVolumeName (\s a -> s { _eCSTaskDefinitionVolumeName = a })
