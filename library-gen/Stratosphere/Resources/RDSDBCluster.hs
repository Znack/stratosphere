{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html

module Stratosphere.Resources.RDSDBCluster where

import Stratosphere.ResourceImports
import Stratosphere.ResourceProperties.Tag

-- | Full data type definition for RDSDBCluster. See 'rdsdbCluster' for a more
-- convenient constructor.
data RDSDBCluster =
  RDSDBCluster
  { _rDSDBClusterAvailabilityZones :: Maybe (ValList Text)
  , _rDSDBClusterBackupRetentionPeriod :: Maybe (Val Integer)
  , _rDSDBClusterDBClusterIdentifier :: Maybe (Val Text)
  , _rDSDBClusterDBClusterParameterGroupName :: Maybe (Val Text)
  , _rDSDBClusterDBSubnetGroupName :: Maybe (Val Text)
  , _rDSDBClusterDatabaseName :: Maybe (Val Text)
  , _rDSDBClusterEngine :: Val Text
  , _rDSDBClusterEngineVersion :: Maybe (Val Text)
  , _rDSDBClusterKmsKeyId :: Maybe (Val Text)
  , _rDSDBClusterMasterUserPassword :: Maybe (Val Text)
  , _rDSDBClusterMasterUsername :: Maybe (Val Text)
  , _rDSDBClusterPort :: Maybe (Val Integer)
  , _rDSDBClusterPreferredBackupWindow :: Maybe (Val Text)
  , _rDSDBClusterPreferredMaintenanceWindow :: Maybe (Val Text)
  , _rDSDBClusterReplicationSourceIdentifier :: Maybe (Val Text)
  , _rDSDBClusterSnapshotIdentifier :: Maybe (Val Text)
  , _rDSDBClusterStorageEncrypted :: Maybe (Val Bool)
  , _rDSDBClusterTags :: Maybe [Tag]
  , _rDSDBClusterVpcSecurityGroupIds :: Maybe (ValList Text)
  } deriving (Show, Eq)

instance ToJSON RDSDBCluster where
  toJSON RDSDBCluster{..} =
    object $
    catMaybes
    [ fmap (("AvailabilityZones",) . toJSON) _rDSDBClusterAvailabilityZones
    , fmap (("BackupRetentionPeriod",) . toJSON . fmap Integer') _rDSDBClusterBackupRetentionPeriod
    , fmap (("DBClusterIdentifier",) . toJSON) _rDSDBClusterDBClusterIdentifier
    , fmap (("DBClusterParameterGroupName",) . toJSON) _rDSDBClusterDBClusterParameterGroupName
    , fmap (("DBSubnetGroupName",) . toJSON) _rDSDBClusterDBSubnetGroupName
    , fmap (("DatabaseName",) . toJSON) _rDSDBClusterDatabaseName
    , (Just . ("Engine",) . toJSON) _rDSDBClusterEngine
    , fmap (("EngineVersion",) . toJSON) _rDSDBClusterEngineVersion
    , fmap (("KmsKeyId",) . toJSON) _rDSDBClusterKmsKeyId
    , fmap (("MasterUserPassword",) . toJSON) _rDSDBClusterMasterUserPassword
    , fmap (("MasterUsername",) . toJSON) _rDSDBClusterMasterUsername
    , fmap (("Port",) . toJSON . fmap Integer') _rDSDBClusterPort
    , fmap (("PreferredBackupWindow",) . toJSON) _rDSDBClusterPreferredBackupWindow
    , fmap (("PreferredMaintenanceWindow",) . toJSON) _rDSDBClusterPreferredMaintenanceWindow
    , fmap (("ReplicationSourceIdentifier",) . toJSON) _rDSDBClusterReplicationSourceIdentifier
    , fmap (("SnapshotIdentifier",) . toJSON) _rDSDBClusterSnapshotIdentifier
    , fmap (("StorageEncrypted",) . toJSON . fmap Bool') _rDSDBClusterStorageEncrypted
    , fmap (("Tags",) . toJSON) _rDSDBClusterTags
    , fmap (("VpcSecurityGroupIds",) . toJSON) _rDSDBClusterVpcSecurityGroupIds
    ]

instance FromJSON RDSDBCluster where
  parseJSON (Object obj) =
    RDSDBCluster <$>
      (obj .:? "AvailabilityZones") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "BackupRetentionPeriod") <*>
      (obj .:? "DBClusterIdentifier") <*>
      (obj .:? "DBClusterParameterGroupName") <*>
      (obj .:? "DBSubnetGroupName") <*>
      (obj .:? "DatabaseName") <*>
      (obj .: "Engine") <*>
      (obj .:? "EngineVersion") <*>
      (obj .:? "KmsKeyId") <*>
      (obj .:? "MasterUserPassword") <*>
      (obj .:? "MasterUsername") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "Port") <*>
      (obj .:? "PreferredBackupWindow") <*>
      (obj .:? "PreferredMaintenanceWindow") <*>
      (obj .:? "ReplicationSourceIdentifier") <*>
      (obj .:? "SnapshotIdentifier") <*>
      fmap (fmap (fmap unBool')) (obj .:? "StorageEncrypted") <*>
      (obj .:? "Tags") <*>
      (obj .:? "VpcSecurityGroupIds")
  parseJSON _ = mempty

-- | Constructor for 'RDSDBCluster' containing required fields as arguments.
rdsdbCluster
  :: Val Text -- ^ 'rdsdbcEngine'
  -> RDSDBCluster
rdsdbCluster enginearg =
  RDSDBCluster
  { _rDSDBClusterAvailabilityZones = Nothing
  , _rDSDBClusterBackupRetentionPeriod = Nothing
  , _rDSDBClusterDBClusterIdentifier = Nothing
  , _rDSDBClusterDBClusterParameterGroupName = Nothing
  , _rDSDBClusterDBSubnetGroupName = Nothing
  , _rDSDBClusterDatabaseName = Nothing
  , _rDSDBClusterEngine = enginearg
  , _rDSDBClusterEngineVersion = Nothing
  , _rDSDBClusterKmsKeyId = Nothing
  , _rDSDBClusterMasterUserPassword = Nothing
  , _rDSDBClusterMasterUsername = Nothing
  , _rDSDBClusterPort = Nothing
  , _rDSDBClusterPreferredBackupWindow = Nothing
  , _rDSDBClusterPreferredMaintenanceWindow = Nothing
  , _rDSDBClusterReplicationSourceIdentifier = Nothing
  , _rDSDBClusterSnapshotIdentifier = Nothing
  , _rDSDBClusterStorageEncrypted = Nothing
  , _rDSDBClusterTags = Nothing
  , _rDSDBClusterVpcSecurityGroupIds = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-availabilityzones
rdsdbcAvailabilityZones :: Lens' RDSDBCluster (Maybe (ValList Text))
rdsdbcAvailabilityZones = lens _rDSDBClusterAvailabilityZones (\s a -> s { _rDSDBClusterAvailabilityZones = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-backuprententionperiod
rdsdbcBackupRetentionPeriod :: Lens' RDSDBCluster (Maybe (Val Integer))
rdsdbcBackupRetentionPeriod = lens _rDSDBClusterBackupRetentionPeriod (\s a -> s { _rDSDBClusterBackupRetentionPeriod = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-dbclusteridentifier
rdsdbcDBClusterIdentifier :: Lens' RDSDBCluster (Maybe (Val Text))
rdsdbcDBClusterIdentifier = lens _rDSDBClusterDBClusterIdentifier (\s a -> s { _rDSDBClusterDBClusterIdentifier = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-dbclusterparametergroupname
rdsdbcDBClusterParameterGroupName :: Lens' RDSDBCluster (Maybe (Val Text))
rdsdbcDBClusterParameterGroupName = lens _rDSDBClusterDBClusterParameterGroupName (\s a -> s { _rDSDBClusterDBClusterParameterGroupName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-dbsubnetgroupname
rdsdbcDBSubnetGroupName :: Lens' RDSDBCluster (Maybe (Val Text))
rdsdbcDBSubnetGroupName = lens _rDSDBClusterDBSubnetGroupName (\s a -> s { _rDSDBClusterDBSubnetGroupName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-databasename
rdsdbcDatabaseName :: Lens' RDSDBCluster (Maybe (Val Text))
rdsdbcDatabaseName = lens _rDSDBClusterDatabaseName (\s a -> s { _rDSDBClusterDatabaseName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-engine
rdsdbcEngine :: Lens' RDSDBCluster (Val Text)
rdsdbcEngine = lens _rDSDBClusterEngine (\s a -> s { _rDSDBClusterEngine = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-engineversion
rdsdbcEngineVersion :: Lens' RDSDBCluster (Maybe (Val Text))
rdsdbcEngineVersion = lens _rDSDBClusterEngineVersion (\s a -> s { _rDSDBClusterEngineVersion = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-kmskeyid
rdsdbcKmsKeyId :: Lens' RDSDBCluster (Maybe (Val Text))
rdsdbcKmsKeyId = lens _rDSDBClusterKmsKeyId (\s a -> s { _rDSDBClusterKmsKeyId = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-masteruserpassword
rdsdbcMasterUserPassword :: Lens' RDSDBCluster (Maybe (Val Text))
rdsdbcMasterUserPassword = lens _rDSDBClusterMasterUserPassword (\s a -> s { _rDSDBClusterMasterUserPassword = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-masterusername
rdsdbcMasterUsername :: Lens' RDSDBCluster (Maybe (Val Text))
rdsdbcMasterUsername = lens _rDSDBClusterMasterUsername (\s a -> s { _rDSDBClusterMasterUsername = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-port
rdsdbcPort :: Lens' RDSDBCluster (Maybe (Val Integer))
rdsdbcPort = lens _rDSDBClusterPort (\s a -> s { _rDSDBClusterPort = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-preferredbackupwindow
rdsdbcPreferredBackupWindow :: Lens' RDSDBCluster (Maybe (Val Text))
rdsdbcPreferredBackupWindow = lens _rDSDBClusterPreferredBackupWindow (\s a -> s { _rDSDBClusterPreferredBackupWindow = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-preferredmaintenancewindow
rdsdbcPreferredMaintenanceWindow :: Lens' RDSDBCluster (Maybe (Val Text))
rdsdbcPreferredMaintenanceWindow = lens _rDSDBClusterPreferredMaintenanceWindow (\s a -> s { _rDSDBClusterPreferredMaintenanceWindow = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-replicationsourceidentifier
rdsdbcReplicationSourceIdentifier :: Lens' RDSDBCluster (Maybe (Val Text))
rdsdbcReplicationSourceIdentifier = lens _rDSDBClusterReplicationSourceIdentifier (\s a -> s { _rDSDBClusterReplicationSourceIdentifier = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-snapshotidentifier
rdsdbcSnapshotIdentifier :: Lens' RDSDBCluster (Maybe (Val Text))
rdsdbcSnapshotIdentifier = lens _rDSDBClusterSnapshotIdentifier (\s a -> s { _rDSDBClusterSnapshotIdentifier = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-storageencrypted
rdsdbcStorageEncrypted :: Lens' RDSDBCluster (Maybe (Val Bool))
rdsdbcStorageEncrypted = lens _rDSDBClusterStorageEncrypted (\s a -> s { _rDSDBClusterStorageEncrypted = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-tags
rdsdbcTags :: Lens' RDSDBCluster (Maybe [Tag])
rdsdbcTags = lens _rDSDBClusterTags (\s a -> s { _rDSDBClusterTags = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html#cfn-rds-dbcluster-vpcsecuritygroupids
rdsdbcVpcSecurityGroupIds :: Lens' RDSDBCluster (Maybe (ValList Text))
rdsdbcVpcSecurityGroupIds = lens _rDSDBClusterVpcSecurityGroupIds (\s a -> s { _rDSDBClusterVpcSecurityGroupIds = a })
