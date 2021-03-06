{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html

module Stratosphere.ResourceProperties.ECSTaskDefinitionContainerDefinition where

import Stratosphere.ResourceImports
import Stratosphere.ResourceProperties.ECSTaskDefinitionKeyValuePair
import Stratosphere.ResourceProperties.ECSTaskDefinitionHostEntry
import Stratosphere.ResourceProperties.ECSTaskDefinitionLinuxParameters
import Stratosphere.ResourceProperties.ECSTaskDefinitionLogConfiguration
import Stratosphere.ResourceProperties.ECSTaskDefinitionMountPoint
import Stratosphere.ResourceProperties.ECSTaskDefinitionPortMapping
import Stratosphere.ResourceProperties.ECSTaskDefinitionUlimit
import Stratosphere.ResourceProperties.ECSTaskDefinitionVolumeFrom

-- | Full data type definition for ECSTaskDefinitionContainerDefinition. See
-- 'ecsTaskDefinitionContainerDefinition' for a more convenient constructor.
data ECSTaskDefinitionContainerDefinition =
  ECSTaskDefinitionContainerDefinition
  { _eCSTaskDefinitionContainerDefinitionCommand :: Maybe (ValList Text)
  , _eCSTaskDefinitionContainerDefinitionCpu :: Maybe (Val Integer)
  , _eCSTaskDefinitionContainerDefinitionDisableNetworking :: Maybe (Val Bool)
  , _eCSTaskDefinitionContainerDefinitionDnsSearchDomains :: Maybe (ValList Text)
  , _eCSTaskDefinitionContainerDefinitionDnsServers :: Maybe (ValList Text)
  , _eCSTaskDefinitionContainerDefinitionDockerLabels :: Maybe Object
  , _eCSTaskDefinitionContainerDefinitionDockerSecurityOptions :: Maybe (ValList Text)
  , _eCSTaskDefinitionContainerDefinitionEntryPoint :: Maybe (ValList Text)
  , _eCSTaskDefinitionContainerDefinitionEnvironment :: Maybe [ECSTaskDefinitionKeyValuePair]
  , _eCSTaskDefinitionContainerDefinitionEssential :: Maybe (Val Bool)
  , _eCSTaskDefinitionContainerDefinitionExtraHosts :: Maybe [ECSTaskDefinitionHostEntry]
  , _eCSTaskDefinitionContainerDefinitionHostname :: Maybe (Val Text)
  , _eCSTaskDefinitionContainerDefinitionImage :: Val Text
  , _eCSTaskDefinitionContainerDefinitionLinks :: Maybe (ValList Text)
  , _eCSTaskDefinitionContainerDefinitionLinuxParameters :: Maybe ECSTaskDefinitionLinuxParameters
  , _eCSTaskDefinitionContainerDefinitionLogConfiguration :: Maybe ECSTaskDefinitionLogConfiguration
  , _eCSTaskDefinitionContainerDefinitionMemory :: Maybe (Val Integer)
  , _eCSTaskDefinitionContainerDefinitionMemoryReservation :: Maybe (Val Integer)
  , _eCSTaskDefinitionContainerDefinitionMountPoints :: Maybe [ECSTaskDefinitionMountPoint]
  , _eCSTaskDefinitionContainerDefinitionName :: Val Text
  , _eCSTaskDefinitionContainerDefinitionPortMappings :: Maybe [ECSTaskDefinitionPortMapping]
  , _eCSTaskDefinitionContainerDefinitionPrivileged :: Maybe (Val Bool)
  , _eCSTaskDefinitionContainerDefinitionReadonlyRootFilesystem :: Maybe (Val Bool)
  , _eCSTaskDefinitionContainerDefinitionUlimits :: Maybe [ECSTaskDefinitionUlimit]
  , _eCSTaskDefinitionContainerDefinitionUser :: Maybe (Val Text)
  , _eCSTaskDefinitionContainerDefinitionVolumesFrom :: Maybe [ECSTaskDefinitionVolumeFrom]
  , _eCSTaskDefinitionContainerDefinitionWorkingDirectory :: Maybe (Val Text)
  } deriving (Show, Eq)

instance ToJSON ECSTaskDefinitionContainerDefinition where
  toJSON ECSTaskDefinitionContainerDefinition{..} =
    object $
    catMaybes
    [ fmap (("Command",) . toJSON) _eCSTaskDefinitionContainerDefinitionCommand
    , fmap (("Cpu",) . toJSON . fmap Integer') _eCSTaskDefinitionContainerDefinitionCpu
    , fmap (("DisableNetworking",) . toJSON . fmap Bool') _eCSTaskDefinitionContainerDefinitionDisableNetworking
    , fmap (("DnsSearchDomains",) . toJSON) _eCSTaskDefinitionContainerDefinitionDnsSearchDomains
    , fmap (("DnsServers",) . toJSON) _eCSTaskDefinitionContainerDefinitionDnsServers
    , fmap (("DockerLabels",) . toJSON) _eCSTaskDefinitionContainerDefinitionDockerLabels
    , fmap (("DockerSecurityOptions",) . toJSON) _eCSTaskDefinitionContainerDefinitionDockerSecurityOptions
    , fmap (("EntryPoint",) . toJSON) _eCSTaskDefinitionContainerDefinitionEntryPoint
    , fmap (("Environment",) . toJSON) _eCSTaskDefinitionContainerDefinitionEnvironment
    , fmap (("Essential",) . toJSON . fmap Bool') _eCSTaskDefinitionContainerDefinitionEssential
    , fmap (("ExtraHosts",) . toJSON) _eCSTaskDefinitionContainerDefinitionExtraHosts
    , fmap (("Hostname",) . toJSON) _eCSTaskDefinitionContainerDefinitionHostname
    , (Just . ("Image",) . toJSON) _eCSTaskDefinitionContainerDefinitionImage
    , fmap (("Links",) . toJSON) _eCSTaskDefinitionContainerDefinitionLinks
    , fmap (("LinuxParameters",) . toJSON) _eCSTaskDefinitionContainerDefinitionLinuxParameters
    , fmap (("LogConfiguration",) . toJSON) _eCSTaskDefinitionContainerDefinitionLogConfiguration
    , fmap (("Memory",) . toJSON . fmap Integer') _eCSTaskDefinitionContainerDefinitionMemory
    , fmap (("MemoryReservation",) . toJSON . fmap Integer') _eCSTaskDefinitionContainerDefinitionMemoryReservation
    , fmap (("MountPoints",) . toJSON) _eCSTaskDefinitionContainerDefinitionMountPoints
    , (Just . ("Name",) . toJSON) _eCSTaskDefinitionContainerDefinitionName
    , fmap (("PortMappings",) . toJSON) _eCSTaskDefinitionContainerDefinitionPortMappings
    , fmap (("Privileged",) . toJSON . fmap Bool') _eCSTaskDefinitionContainerDefinitionPrivileged
    , fmap (("ReadonlyRootFilesystem",) . toJSON . fmap Bool') _eCSTaskDefinitionContainerDefinitionReadonlyRootFilesystem
    , fmap (("Ulimits",) . toJSON) _eCSTaskDefinitionContainerDefinitionUlimits
    , fmap (("User",) . toJSON) _eCSTaskDefinitionContainerDefinitionUser
    , fmap (("VolumesFrom",) . toJSON) _eCSTaskDefinitionContainerDefinitionVolumesFrom
    , fmap (("WorkingDirectory",) . toJSON) _eCSTaskDefinitionContainerDefinitionWorkingDirectory
    ]

instance FromJSON ECSTaskDefinitionContainerDefinition where
  parseJSON (Object obj) =
    ECSTaskDefinitionContainerDefinition <$>
      (obj .:? "Command") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "Cpu") <*>
      fmap (fmap (fmap unBool')) (obj .:? "DisableNetworking") <*>
      (obj .:? "DnsSearchDomains") <*>
      (obj .:? "DnsServers") <*>
      (obj .:? "DockerLabels") <*>
      (obj .:? "DockerSecurityOptions") <*>
      (obj .:? "EntryPoint") <*>
      (obj .:? "Environment") <*>
      fmap (fmap (fmap unBool')) (obj .:? "Essential") <*>
      (obj .:? "ExtraHosts") <*>
      (obj .:? "Hostname") <*>
      (obj .: "Image") <*>
      (obj .:? "Links") <*>
      (obj .:? "LinuxParameters") <*>
      (obj .:? "LogConfiguration") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "Memory") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "MemoryReservation") <*>
      (obj .:? "MountPoints") <*>
      (obj .: "Name") <*>
      (obj .:? "PortMappings") <*>
      fmap (fmap (fmap unBool')) (obj .:? "Privileged") <*>
      fmap (fmap (fmap unBool')) (obj .:? "ReadonlyRootFilesystem") <*>
      (obj .:? "Ulimits") <*>
      (obj .:? "User") <*>
      (obj .:? "VolumesFrom") <*>
      (obj .:? "WorkingDirectory")
  parseJSON _ = mempty

-- | Constructor for 'ECSTaskDefinitionContainerDefinition' containing
-- required fields as arguments.
ecsTaskDefinitionContainerDefinition
  :: Val Text -- ^ 'ecstdcdImage'
  -> Val Text -- ^ 'ecstdcdName'
  -> ECSTaskDefinitionContainerDefinition
ecsTaskDefinitionContainerDefinition imagearg namearg =
  ECSTaskDefinitionContainerDefinition
  { _eCSTaskDefinitionContainerDefinitionCommand = Nothing
  , _eCSTaskDefinitionContainerDefinitionCpu = Nothing
  , _eCSTaskDefinitionContainerDefinitionDisableNetworking = Nothing
  , _eCSTaskDefinitionContainerDefinitionDnsSearchDomains = Nothing
  , _eCSTaskDefinitionContainerDefinitionDnsServers = Nothing
  , _eCSTaskDefinitionContainerDefinitionDockerLabels = Nothing
  , _eCSTaskDefinitionContainerDefinitionDockerSecurityOptions = Nothing
  , _eCSTaskDefinitionContainerDefinitionEntryPoint = Nothing
  , _eCSTaskDefinitionContainerDefinitionEnvironment = Nothing
  , _eCSTaskDefinitionContainerDefinitionEssential = Nothing
  , _eCSTaskDefinitionContainerDefinitionExtraHosts = Nothing
  , _eCSTaskDefinitionContainerDefinitionHostname = Nothing
  , _eCSTaskDefinitionContainerDefinitionImage = imagearg
  , _eCSTaskDefinitionContainerDefinitionLinks = Nothing
  , _eCSTaskDefinitionContainerDefinitionLinuxParameters = Nothing
  , _eCSTaskDefinitionContainerDefinitionLogConfiguration = Nothing
  , _eCSTaskDefinitionContainerDefinitionMemory = Nothing
  , _eCSTaskDefinitionContainerDefinitionMemoryReservation = Nothing
  , _eCSTaskDefinitionContainerDefinitionMountPoints = Nothing
  , _eCSTaskDefinitionContainerDefinitionName = namearg
  , _eCSTaskDefinitionContainerDefinitionPortMappings = Nothing
  , _eCSTaskDefinitionContainerDefinitionPrivileged = Nothing
  , _eCSTaskDefinitionContainerDefinitionReadonlyRootFilesystem = Nothing
  , _eCSTaskDefinitionContainerDefinitionUlimits = Nothing
  , _eCSTaskDefinitionContainerDefinitionUser = Nothing
  , _eCSTaskDefinitionContainerDefinitionVolumesFrom = Nothing
  , _eCSTaskDefinitionContainerDefinitionWorkingDirectory = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-command
ecstdcdCommand :: Lens' ECSTaskDefinitionContainerDefinition (Maybe (ValList Text))
ecstdcdCommand = lens _eCSTaskDefinitionContainerDefinitionCommand (\s a -> s { _eCSTaskDefinitionContainerDefinitionCommand = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-cpu
ecstdcdCpu :: Lens' ECSTaskDefinitionContainerDefinition (Maybe (Val Integer))
ecstdcdCpu = lens _eCSTaskDefinitionContainerDefinitionCpu (\s a -> s { _eCSTaskDefinitionContainerDefinitionCpu = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-disablenetworking
ecstdcdDisableNetworking :: Lens' ECSTaskDefinitionContainerDefinition (Maybe (Val Bool))
ecstdcdDisableNetworking = lens _eCSTaskDefinitionContainerDefinitionDisableNetworking (\s a -> s { _eCSTaskDefinitionContainerDefinitionDisableNetworking = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-dnssearchdomains
ecstdcdDnsSearchDomains :: Lens' ECSTaskDefinitionContainerDefinition (Maybe (ValList Text))
ecstdcdDnsSearchDomains = lens _eCSTaskDefinitionContainerDefinitionDnsSearchDomains (\s a -> s { _eCSTaskDefinitionContainerDefinitionDnsSearchDomains = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-dnsservers
ecstdcdDnsServers :: Lens' ECSTaskDefinitionContainerDefinition (Maybe (ValList Text))
ecstdcdDnsServers = lens _eCSTaskDefinitionContainerDefinitionDnsServers (\s a -> s { _eCSTaskDefinitionContainerDefinitionDnsServers = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-dockerlabels
ecstdcdDockerLabels :: Lens' ECSTaskDefinitionContainerDefinition (Maybe Object)
ecstdcdDockerLabels = lens _eCSTaskDefinitionContainerDefinitionDockerLabels (\s a -> s { _eCSTaskDefinitionContainerDefinitionDockerLabels = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-dockersecurityoptions
ecstdcdDockerSecurityOptions :: Lens' ECSTaskDefinitionContainerDefinition (Maybe (ValList Text))
ecstdcdDockerSecurityOptions = lens _eCSTaskDefinitionContainerDefinitionDockerSecurityOptions (\s a -> s { _eCSTaskDefinitionContainerDefinitionDockerSecurityOptions = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-entrypoint
ecstdcdEntryPoint :: Lens' ECSTaskDefinitionContainerDefinition (Maybe (ValList Text))
ecstdcdEntryPoint = lens _eCSTaskDefinitionContainerDefinitionEntryPoint (\s a -> s { _eCSTaskDefinitionContainerDefinitionEntryPoint = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-environment
ecstdcdEnvironment :: Lens' ECSTaskDefinitionContainerDefinition (Maybe [ECSTaskDefinitionKeyValuePair])
ecstdcdEnvironment = lens _eCSTaskDefinitionContainerDefinitionEnvironment (\s a -> s { _eCSTaskDefinitionContainerDefinitionEnvironment = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-essential
ecstdcdEssential :: Lens' ECSTaskDefinitionContainerDefinition (Maybe (Val Bool))
ecstdcdEssential = lens _eCSTaskDefinitionContainerDefinitionEssential (\s a -> s { _eCSTaskDefinitionContainerDefinitionEssential = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-extrahosts
ecstdcdExtraHosts :: Lens' ECSTaskDefinitionContainerDefinition (Maybe [ECSTaskDefinitionHostEntry])
ecstdcdExtraHosts = lens _eCSTaskDefinitionContainerDefinitionExtraHosts (\s a -> s { _eCSTaskDefinitionContainerDefinitionExtraHosts = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-hostname
ecstdcdHostname :: Lens' ECSTaskDefinitionContainerDefinition (Maybe (Val Text))
ecstdcdHostname = lens _eCSTaskDefinitionContainerDefinitionHostname (\s a -> s { _eCSTaskDefinitionContainerDefinitionHostname = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-image
ecstdcdImage :: Lens' ECSTaskDefinitionContainerDefinition (Val Text)
ecstdcdImage = lens _eCSTaskDefinitionContainerDefinitionImage (\s a -> s { _eCSTaskDefinitionContainerDefinitionImage = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-links
ecstdcdLinks :: Lens' ECSTaskDefinitionContainerDefinition (Maybe (ValList Text))
ecstdcdLinks = lens _eCSTaskDefinitionContainerDefinitionLinks (\s a -> s { _eCSTaskDefinitionContainerDefinitionLinks = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-linuxparameters
ecstdcdLinuxParameters :: Lens' ECSTaskDefinitionContainerDefinition (Maybe ECSTaskDefinitionLinuxParameters)
ecstdcdLinuxParameters = lens _eCSTaskDefinitionContainerDefinitionLinuxParameters (\s a -> s { _eCSTaskDefinitionContainerDefinitionLinuxParameters = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-logconfiguration
ecstdcdLogConfiguration :: Lens' ECSTaskDefinitionContainerDefinition (Maybe ECSTaskDefinitionLogConfiguration)
ecstdcdLogConfiguration = lens _eCSTaskDefinitionContainerDefinitionLogConfiguration (\s a -> s { _eCSTaskDefinitionContainerDefinitionLogConfiguration = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-memory
ecstdcdMemory :: Lens' ECSTaskDefinitionContainerDefinition (Maybe (Val Integer))
ecstdcdMemory = lens _eCSTaskDefinitionContainerDefinitionMemory (\s a -> s { _eCSTaskDefinitionContainerDefinitionMemory = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-memoryreservation
ecstdcdMemoryReservation :: Lens' ECSTaskDefinitionContainerDefinition (Maybe (Val Integer))
ecstdcdMemoryReservation = lens _eCSTaskDefinitionContainerDefinitionMemoryReservation (\s a -> s { _eCSTaskDefinitionContainerDefinitionMemoryReservation = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-mountpoints
ecstdcdMountPoints :: Lens' ECSTaskDefinitionContainerDefinition (Maybe [ECSTaskDefinitionMountPoint])
ecstdcdMountPoints = lens _eCSTaskDefinitionContainerDefinitionMountPoints (\s a -> s { _eCSTaskDefinitionContainerDefinitionMountPoints = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-name
ecstdcdName :: Lens' ECSTaskDefinitionContainerDefinition (Val Text)
ecstdcdName = lens _eCSTaskDefinitionContainerDefinitionName (\s a -> s { _eCSTaskDefinitionContainerDefinitionName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-portmappings
ecstdcdPortMappings :: Lens' ECSTaskDefinitionContainerDefinition (Maybe [ECSTaskDefinitionPortMapping])
ecstdcdPortMappings = lens _eCSTaskDefinitionContainerDefinitionPortMappings (\s a -> s { _eCSTaskDefinitionContainerDefinitionPortMappings = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-privileged
ecstdcdPrivileged :: Lens' ECSTaskDefinitionContainerDefinition (Maybe (Val Bool))
ecstdcdPrivileged = lens _eCSTaskDefinitionContainerDefinitionPrivileged (\s a -> s { _eCSTaskDefinitionContainerDefinitionPrivileged = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-readonlyrootfilesystem
ecstdcdReadonlyRootFilesystem :: Lens' ECSTaskDefinitionContainerDefinition (Maybe (Val Bool))
ecstdcdReadonlyRootFilesystem = lens _eCSTaskDefinitionContainerDefinitionReadonlyRootFilesystem (\s a -> s { _eCSTaskDefinitionContainerDefinitionReadonlyRootFilesystem = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-ulimits
ecstdcdUlimits :: Lens' ECSTaskDefinitionContainerDefinition (Maybe [ECSTaskDefinitionUlimit])
ecstdcdUlimits = lens _eCSTaskDefinitionContainerDefinitionUlimits (\s a -> s { _eCSTaskDefinitionContainerDefinitionUlimits = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-user
ecstdcdUser :: Lens' ECSTaskDefinitionContainerDefinition (Maybe (Val Text))
ecstdcdUser = lens _eCSTaskDefinitionContainerDefinitionUser (\s a -> s { _eCSTaskDefinitionContainerDefinitionUser = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-volumesfrom
ecstdcdVolumesFrom :: Lens' ECSTaskDefinitionContainerDefinition (Maybe [ECSTaskDefinitionVolumeFrom])
ecstdcdVolumesFrom = lens _eCSTaskDefinitionContainerDefinitionVolumesFrom (\s a -> s { _eCSTaskDefinitionContainerDefinitionVolumesFrom = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ecs-taskdefinition-containerdefinitions.html#cfn-ecs-taskdefinition-containerdefinition-workingdirectory
ecstdcdWorkingDirectory :: Lens' ECSTaskDefinitionContainerDefinition (Maybe (Val Text))
ecstdcdWorkingDirectory = lens _eCSTaskDefinitionContainerDefinitionWorkingDirectory (\s a -> s { _eCSTaskDefinitionContainerDefinitionWorkingDirectory = a })
