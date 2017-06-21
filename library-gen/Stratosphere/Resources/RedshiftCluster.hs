{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html

module Stratosphere.Resources.RedshiftCluster where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.Tag

-- | Full data type definition for RedshiftCluster. See 'redshiftCluster' for
-- a more convenient constructor.
data RedshiftCluster =
  RedshiftCluster
  { _redshiftClusterAllowVersionUpgrade :: Maybe (Val Bool')
  , _redshiftClusterAutomatedSnapshotRetentionPeriod :: Maybe (Val Integer')
  , _redshiftClusterAvailabilityZone :: Maybe (Val Text)
  , _redshiftClusterClusterParameterGroupName :: Maybe (Val Text)
  , _redshiftClusterClusterSecurityGroups :: Maybe [Val Text]
  , _redshiftClusterClusterSubnetGroupName :: Maybe (Val Text)
  , _redshiftClusterClusterType :: Val Text
  , _redshiftClusterClusterVersion :: Maybe (Val Text)
  , _redshiftClusterDBName :: Val Text
  , _redshiftClusterElasticIp :: Maybe (Val Text)
  , _redshiftClusterEncrypted :: Maybe (Val Bool')
  , _redshiftClusterHsmClientCertificateIdentifier :: Maybe (Val Text)
  , _redshiftClusterHsmConfigurationIdentifier :: Maybe (Val Text)
  , _redshiftClusterIamRoles :: Maybe [Val Text]
  , _redshiftClusterKmsKeyId :: Maybe (Val Text)
  , _redshiftClusterMasterUserPassword :: Val Text
  , _redshiftClusterMasterUsername :: Val Text
  , _redshiftClusterNodeType :: Val Text
  , _redshiftClusterNumberOfNodes :: Maybe (Val Integer')
  , _redshiftClusterOwnerAccount :: Maybe (Val Text)
  , _redshiftClusterPort :: Maybe (Val Integer')
  , _redshiftClusterPreferredMaintenanceWindow :: Maybe (Val Text)
  , _redshiftClusterPubliclyAccessible :: Maybe (Val Bool')
  , _redshiftClusterSnapshotClusterIdentifier :: Maybe (Val Text)
  , _redshiftClusterSnapshotIdentifier :: Maybe (Val Text)
  , _redshiftClusterTags :: Maybe [Tag]
  , _redshiftClusterVpcSecurityGroupIds :: Maybe [Val Text]
  } deriving (Show, Eq)

instance ToJSON RedshiftCluster where
  toJSON RedshiftCluster{..} =
    object $
    catMaybes
    [ ("AllowVersionUpgrade" .=) <$> _redshiftClusterAllowVersionUpgrade
    , ("AutomatedSnapshotRetentionPeriod" .=) <$> _redshiftClusterAutomatedSnapshotRetentionPeriod
    , ("AvailabilityZone" .=) <$> _redshiftClusterAvailabilityZone
    , ("ClusterParameterGroupName" .=) <$> _redshiftClusterClusterParameterGroupName
    , ("ClusterSecurityGroups" .=) <$> _redshiftClusterClusterSecurityGroups
    , ("ClusterSubnetGroupName" .=) <$> _redshiftClusterClusterSubnetGroupName
    , Just ("ClusterType" .= _redshiftClusterClusterType)
    , ("ClusterVersion" .=) <$> _redshiftClusterClusterVersion
    , Just ("DBName" .= _redshiftClusterDBName)
    , ("ElasticIp" .=) <$> _redshiftClusterElasticIp
    , ("Encrypted" .=) <$> _redshiftClusterEncrypted
    , ("HsmClientCertificateIdentifier" .=) <$> _redshiftClusterHsmClientCertificateIdentifier
    , ("HsmConfigurationIdentifier" .=) <$> _redshiftClusterHsmConfigurationIdentifier
    , ("IamRoles" .=) <$> _redshiftClusterIamRoles
    , ("KmsKeyId" .=) <$> _redshiftClusterKmsKeyId
    , Just ("MasterUserPassword" .= _redshiftClusterMasterUserPassword)
    , Just ("MasterUsername" .= _redshiftClusterMasterUsername)
    , Just ("NodeType" .= _redshiftClusterNodeType)
    , ("NumberOfNodes" .=) <$> _redshiftClusterNumberOfNodes
    , ("OwnerAccount" .=) <$> _redshiftClusterOwnerAccount
    , ("Port" .=) <$> _redshiftClusterPort
    , ("PreferredMaintenanceWindow" .=) <$> _redshiftClusterPreferredMaintenanceWindow
    , ("PubliclyAccessible" .=) <$> _redshiftClusterPubliclyAccessible
    , ("SnapshotClusterIdentifier" .=) <$> _redshiftClusterSnapshotClusterIdentifier
    , ("SnapshotIdentifier" .=) <$> _redshiftClusterSnapshotIdentifier
    , ("Tags" .=) <$> _redshiftClusterTags
    , ("VpcSecurityGroupIds" .=) <$> _redshiftClusterVpcSecurityGroupIds
    ]

instance FromJSON RedshiftCluster where
  parseJSON (Object obj) =
    RedshiftCluster <$>
      obj .:? "AllowVersionUpgrade" <*>
      obj .:? "AutomatedSnapshotRetentionPeriod" <*>
      obj .:? "AvailabilityZone" <*>
      obj .:? "ClusterParameterGroupName" <*>
      obj .:? "ClusterSecurityGroups" <*>
      obj .:? "ClusterSubnetGroupName" <*>
      obj .: "ClusterType" <*>
      obj .:? "ClusterVersion" <*>
      obj .: "DBName" <*>
      obj .:? "ElasticIp" <*>
      obj .:? "Encrypted" <*>
      obj .:? "HsmClientCertificateIdentifier" <*>
      obj .:? "HsmConfigurationIdentifier" <*>
      obj .:? "IamRoles" <*>
      obj .:? "KmsKeyId" <*>
      obj .: "MasterUserPassword" <*>
      obj .: "MasterUsername" <*>
      obj .: "NodeType" <*>
      obj .:? "NumberOfNodes" <*>
      obj .:? "OwnerAccount" <*>
      obj .:? "Port" <*>
      obj .:? "PreferredMaintenanceWindow" <*>
      obj .:? "PubliclyAccessible" <*>
      obj .:? "SnapshotClusterIdentifier" <*>
      obj .:? "SnapshotIdentifier" <*>
      obj .:? "Tags" <*>
      obj .:? "VpcSecurityGroupIds"
  parseJSON _ = mempty

-- | Constructor for 'RedshiftCluster' containing required fields as
-- arguments.
redshiftCluster
  :: Val Text -- ^ 'rcClusterType'
  -> Val Text -- ^ 'rcDBName'
  -> Val Text -- ^ 'rcMasterUserPassword'
  -> Val Text -- ^ 'rcMasterUsername'
  -> Val Text -- ^ 'rcNodeType'
  -> RedshiftCluster
redshiftCluster clusterTypearg dBNamearg masterUserPasswordarg masterUsernamearg nodeTypearg =
  RedshiftCluster
  { _redshiftClusterAllowVersionUpgrade = Nothing
  , _redshiftClusterAutomatedSnapshotRetentionPeriod = Nothing
  , _redshiftClusterAvailabilityZone = Nothing
  , _redshiftClusterClusterParameterGroupName = Nothing
  , _redshiftClusterClusterSecurityGroups = Nothing
  , _redshiftClusterClusterSubnetGroupName = Nothing
  , _redshiftClusterClusterType = clusterTypearg
  , _redshiftClusterClusterVersion = Nothing
  , _redshiftClusterDBName = dBNamearg
  , _redshiftClusterElasticIp = Nothing
  , _redshiftClusterEncrypted = Nothing
  , _redshiftClusterHsmClientCertificateIdentifier = Nothing
  , _redshiftClusterHsmConfigurationIdentifier = Nothing
  , _redshiftClusterIamRoles = Nothing
  , _redshiftClusterKmsKeyId = Nothing
  , _redshiftClusterMasterUserPassword = masterUserPasswordarg
  , _redshiftClusterMasterUsername = masterUsernamearg
  , _redshiftClusterNodeType = nodeTypearg
  , _redshiftClusterNumberOfNodes = Nothing
  , _redshiftClusterOwnerAccount = Nothing
  , _redshiftClusterPort = Nothing
  , _redshiftClusterPreferredMaintenanceWindow = Nothing
  , _redshiftClusterPubliclyAccessible = Nothing
  , _redshiftClusterSnapshotClusterIdentifier = Nothing
  , _redshiftClusterSnapshotIdentifier = Nothing
  , _redshiftClusterTags = Nothing
  , _redshiftClusterVpcSecurityGroupIds = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-allowversionupgrade
rcAllowVersionUpgrade :: Lens' RedshiftCluster (Maybe (Val Bool'))
rcAllowVersionUpgrade = lens _redshiftClusterAllowVersionUpgrade (\s a -> s { _redshiftClusterAllowVersionUpgrade = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-automatedsnapshotretentionperiod
rcAutomatedSnapshotRetentionPeriod :: Lens' RedshiftCluster (Maybe (Val Integer'))
rcAutomatedSnapshotRetentionPeriod = lens _redshiftClusterAutomatedSnapshotRetentionPeriod (\s a -> s { _redshiftClusterAutomatedSnapshotRetentionPeriod = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-availabilityzone
rcAvailabilityZone :: Lens' RedshiftCluster (Maybe (Val Text))
rcAvailabilityZone = lens _redshiftClusterAvailabilityZone (\s a -> s { _redshiftClusterAvailabilityZone = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-clusterparametergroupname
rcClusterParameterGroupName :: Lens' RedshiftCluster (Maybe (Val Text))
rcClusterParameterGroupName = lens _redshiftClusterClusterParameterGroupName (\s a -> s { _redshiftClusterClusterParameterGroupName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-clustersecuritygroups
rcClusterSecurityGroups :: Lens' RedshiftCluster (Maybe [Val Text])
rcClusterSecurityGroups = lens _redshiftClusterClusterSecurityGroups (\s a -> s { _redshiftClusterClusterSecurityGroups = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-clustersubnetgroupname
rcClusterSubnetGroupName :: Lens' RedshiftCluster (Maybe (Val Text))
rcClusterSubnetGroupName = lens _redshiftClusterClusterSubnetGroupName (\s a -> s { _redshiftClusterClusterSubnetGroupName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-clustertype
rcClusterType :: Lens' RedshiftCluster (Val Text)
rcClusterType = lens _redshiftClusterClusterType (\s a -> s { _redshiftClusterClusterType = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-clusterversion
rcClusterVersion :: Lens' RedshiftCluster (Maybe (Val Text))
rcClusterVersion = lens _redshiftClusterClusterVersion (\s a -> s { _redshiftClusterClusterVersion = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-dbname
rcDBName :: Lens' RedshiftCluster (Val Text)
rcDBName = lens _redshiftClusterDBName (\s a -> s { _redshiftClusterDBName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-elasticip
rcElasticIp :: Lens' RedshiftCluster (Maybe (Val Text))
rcElasticIp = lens _redshiftClusterElasticIp (\s a -> s { _redshiftClusterElasticIp = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-encrypted
rcEncrypted :: Lens' RedshiftCluster (Maybe (Val Bool'))
rcEncrypted = lens _redshiftClusterEncrypted (\s a -> s { _redshiftClusterEncrypted = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-hsmclientcertidentifier
rcHsmClientCertificateIdentifier :: Lens' RedshiftCluster (Maybe (Val Text))
rcHsmClientCertificateIdentifier = lens _redshiftClusterHsmClientCertificateIdentifier (\s a -> s { _redshiftClusterHsmClientCertificateIdentifier = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-HsmConfigurationIdentifier
rcHsmConfigurationIdentifier :: Lens' RedshiftCluster (Maybe (Val Text))
rcHsmConfigurationIdentifier = lens _redshiftClusterHsmConfigurationIdentifier (\s a -> s { _redshiftClusterHsmConfigurationIdentifier = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-iamroles
rcIamRoles :: Lens' RedshiftCluster (Maybe [Val Text])
rcIamRoles = lens _redshiftClusterIamRoles (\s a -> s { _redshiftClusterIamRoles = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-kmskeyid
rcKmsKeyId :: Lens' RedshiftCluster (Maybe (Val Text))
rcKmsKeyId = lens _redshiftClusterKmsKeyId (\s a -> s { _redshiftClusterKmsKeyId = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-masteruserpassword
rcMasterUserPassword :: Lens' RedshiftCluster (Val Text)
rcMasterUserPassword = lens _redshiftClusterMasterUserPassword (\s a -> s { _redshiftClusterMasterUserPassword = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-masterusername
rcMasterUsername :: Lens' RedshiftCluster (Val Text)
rcMasterUsername = lens _redshiftClusterMasterUsername (\s a -> s { _redshiftClusterMasterUsername = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-nodetype
rcNodeType :: Lens' RedshiftCluster (Val Text)
rcNodeType = lens _redshiftClusterNodeType (\s a -> s { _redshiftClusterNodeType = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-nodetype
rcNumberOfNodes :: Lens' RedshiftCluster (Maybe (Val Integer'))
rcNumberOfNodes = lens _redshiftClusterNumberOfNodes (\s a -> s { _redshiftClusterNumberOfNodes = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-owneraccount
rcOwnerAccount :: Lens' RedshiftCluster (Maybe (Val Text))
rcOwnerAccount = lens _redshiftClusterOwnerAccount (\s a -> s { _redshiftClusterOwnerAccount = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-port
rcPort :: Lens' RedshiftCluster (Maybe (Val Integer'))
rcPort = lens _redshiftClusterPort (\s a -> s { _redshiftClusterPort = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-preferredmaintenancewindow
rcPreferredMaintenanceWindow :: Lens' RedshiftCluster (Maybe (Val Text))
rcPreferredMaintenanceWindow = lens _redshiftClusterPreferredMaintenanceWindow (\s a -> s { _redshiftClusterPreferredMaintenanceWindow = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-publiclyaccessible
rcPubliclyAccessible :: Lens' RedshiftCluster (Maybe (Val Bool'))
rcPubliclyAccessible = lens _redshiftClusterPubliclyAccessible (\s a -> s { _redshiftClusterPubliclyAccessible = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-snapshotclusteridentifier
rcSnapshotClusterIdentifier :: Lens' RedshiftCluster (Maybe (Val Text))
rcSnapshotClusterIdentifier = lens _redshiftClusterSnapshotClusterIdentifier (\s a -> s { _redshiftClusterSnapshotClusterIdentifier = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-snapshotidentifier
rcSnapshotIdentifier :: Lens' RedshiftCluster (Maybe (Val Text))
rcSnapshotIdentifier = lens _redshiftClusterSnapshotIdentifier (\s a -> s { _redshiftClusterSnapshotIdentifier = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-tags
rcTags :: Lens' RedshiftCluster (Maybe [Tag])
rcTags = lens _redshiftClusterTags (\s a -> s { _redshiftClusterTags = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-cluster.html#cfn-redshift-cluster-vpcsecuritygroupids
rcVpcSecurityGroupIds :: Lens' RedshiftCluster (Maybe [Val Text])
rcVpcSecurityGroupIds = lens _redshiftClusterVpcSecurityGroupIds (\s a -> s { _redshiftClusterVpcSecurityGroupIds = a })
