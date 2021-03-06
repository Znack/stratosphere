{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance-nodevice.html

module Stratosphere.ResourceProperties.EC2InstanceNoDevice where

import Stratosphere.ResourceImports


-- | Full data type definition for EC2InstanceNoDevice. See
-- 'ec2InstanceNoDevice' for a more convenient constructor.
data EC2InstanceNoDevice =
  EC2InstanceNoDevice
  { 
  } deriving (Show, Eq)

instance ToJSON EC2InstanceNoDevice where
  toJSON _ = toJSON ([] :: [String])

instance FromJSON EC2InstanceNoDevice where
  parseJSON (Array _) = return EC2InstanceNoDevice
  parseJSON _ = mempty

-- | Constructor for 'EC2InstanceNoDevice' containing required fields as
-- arguments.
ec2InstanceNoDevice
  :: EC2InstanceNoDevice
ec2InstanceNoDevice  =
  EC2InstanceNoDevice
  { 
  }


