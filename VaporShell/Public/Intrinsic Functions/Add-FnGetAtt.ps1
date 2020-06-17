function Add-FnGetAtt {
    <#
    .SYNOPSIS
        Adds the intrinsic function "Fn::GetAtt" to a resource property

    .DESCRIPTION
        The Fn::GetAtt intrinsic function returns the value of an attribute from a resource in the template.

    .LINK
        http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-getatt.html

    .PARAMETER LogicalNameOfResource
        The logical name of the resource that contains the attribute that you want.

    .PARAMETER AttributeName
        The name of the resource-specific attribute whose value you want. See the resource's reference page for details about the attributes available for that resource type.

    .EXAMPLE
        Add-FnGetAtt -LogicalNameOfResource "MyLB" -AttributeName "DNSName"

        When the template is exported, this will convert to: {"Fn::GetAtt":["MyLB","DNSName"]}

    .NOTES
        For the Fn::GetAtt logical resource name, you cannot use functions. You must specify a string that is a resource's logical ID.

        For the Fn::GetAtt attribute name, you can use the Ref function.



        You can retrieve the following attributes using Fn::GetAtt :

        Resource TypeName                                                      Attribute                      Description
        -----------------                                                      ---------                      -----------
        AWS::ApiGateway::RestApi                                               RootResourceId                 The root resource ID for a?RestApi?resource.

                                                                                                            Example: a0bc123d4e
        AWS::CloudFormation::WaitCondition                                     Data                           For more information about wait condition signals, see Wait Condition Signal JSON Format.

                                                                                                            Example of a wait condition with two signals:
                                                                                                            {"Signal1":"Step 1 complete.","Signal2":"Step 2 complete."}

        AWS::CloudFormation::Stack                                             Outputs.NestedStackOutputName  The output value from the nested stack that you specified, where?NestedStackOutputName?is the name of the output value.
        AWS::CloudFront::Distribution                                          DomainName                     Example:?d2fadu0nynjpfn.cloudfront.net
        AWS::CodeBuild::Project                                                Arn                            Example:?arn:aws:codebuild:us-west-2:123456789012:project/myProjectName
        AWS::CodeCommit::Repository                                            Arn                            Example:?arn:aws:codecommit:us-east-1:123456789012:MyDemoRepo
        AWS::CodeCommit::Repository                                            CloneUrlHttp                   Example:?https://codecommit.us-east-1.amazonaws.com/v1/repos/MyDemoRepo
        AWS::CodeCommit::Repository                                            CloneUrlSsh                    Example:?ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos//v1/repos/MyDemoRepo
        AWS::CodeCommit::Repository                                            Name                           Example:?MyDemoRepo
        AWS::Config::ConfigRule                                                Arn                            Example:?arn:aws:config:us-east-1:123456789012:config-rule/config-rule-a1bzhi
        AWS::Config::ConfigRule                                                ConfigRuleId                   Example:?config-rule-a1bzhi
        AWS::Config::ConfigRule                                                Compliance.Type                Example:?COMPLIANT
        AWS::DirectoryService::MicrosoftAD and AWS::DirectoryService::SimpleAD Alias                          The alias for a directory.

                                                                                                            Examples:?d-12373a053a?or?alias4-mydirectory-12345abcgmzsk?(if you have the?CreateAliasproperty set to true)
        AWS::DirectoryService::MicrosoftAD and AWS::DirectoryService::SimpleAD DnsIpAddresses                 The IP addresses of the DNS servers for the directory.

                                                                                                            Example:?[ "192.0.2.1", "192.0.2.2" ]
        AWS::DynamoDB::Table                                                   StreamArn                      The Amazon Resource Name (ARN) of the DynamoDB stream. To use this attribute, you must specify the DynamoDB table?StreamSpecification?property.

                                                                                                            Example:?arn:aws:dynamodb:us-east-1:123456789012:table/testddbstack-myDynamoDBTable-012A1SL7SMP5Q/stream/2015-11-30T20:10:00.000
        AWS::EC2::EIP                                                          AllocationId                   The ID that AWS assigns to represent the allocation of the address for use with Amazon VPC. It is returned only for VPC Elastic IP addresses.

                                                                                                            Example:?eipalloc-5723d13e
        AWS::EC2::Instance                                                     AvailabilityZone               The Availability Zone where the instance that you specified is launched.

                                                                                                            Example:?us-east-1b
        AWS::EC2::Instance                                                     PrivateDnsName                 The private DNS name of the instance that you specified.

                                                                                                            Example:?ip-10-24-34-0.ec2.internal
        AWS::EC2::Instance                                                     PublicDnsName                  The public DNS name of the instance that you specified.

                                                                                                            Example:?ec2-107-20-50-45.compute-1.amazonaws.com
        AWS::EC2::Instance                                                     PrivateIp                      The private IP address of the instance that you specified.

                                                                                                            Example:?10.24.34.0
        AWS::EC2::Instance                                                     PublicIp                       The public IP address of the instance that you specified.

                                                                                                            Example:?192.0.2.0
        AWS::EC2::NetworkInterface                                             PrimaryPrivateIpAddress        The primary private IP address of the network interface that you specified.

                                                                                                            Example:?10.0.0.192
        AWS::EC2::NetworkInterface                                             SecondaryPrivateIpAddresses    The secondary private IP addresses of the network interface that you specified.

                                                                                                            Example:?["10.0.0.161", "10.0.0.162", "10.0.0.163"]
        AWS::EC2::SecurityGroup                                                GroupId                        The group ID of the specified security group.

                                                                                                            Example:?sg-94b3a1f6
        AWS::EC2::Subnet                                                       AvailabilityZone               The Availability Zone of the subnet.

                                                                                                            Example:?us-east-1a
        AWS::EC2::Subnet                                                       Ipv6CidrBlocks                 A list of IPv6 CIDR blocks that are associated with the subnet.

                                                                                                            Example:?[ 2001:db8:1234:1a00::/64 ]
        AWS::EC2::SubnetNetworkAclAssociation                                  AssociationId                  The?NetworkAcl associationId?that is attached to a subnet.
        AWS::EC2::VPC                                                          CidrBlock                      The set of IP addresses for the VPC.

                                                                                                            Example:?10.0.0.0/16
        AWS::EC2::VPC                                                          DefaultNetworkAcl              The default network ACL ID that is associated with the VPC, which AWS creates when you create a VPC.

                                                                                                            Example:?acl-814dafe3
        AWS::EC2::VPC                                                          DefaultSecurityGroup           The default security group ID that is associated with the VPC, which AWS creates when you create a VPC.

                                                                                                            Example:?sg-b178e0d3
        AWS::EC2::VPC                                                          Ipv6CidrBlocks                 A list of IPv6 CIDR blocks that are associated with the VPC.

                                                                                                            Example:?[ 2001:db8:1234:1a00::/56 ]
        AWS::ECS::Service                                                      Name                           The name of an Amazon EC2 Container Service service.

                                                                                                            Example:?sample-webapp
        AWS::ElastiCache::CacheCluster                                         ConfigurationEndpoint.Address  The DNS address of the configuration endpoint for the Memcached cache cluster.

                                                                                                            Example:?test.abc12a.cfg.use1.cache.amazonaws.com:11111
        AWS::ElastiCache::CacheCluster                                         ConfigurationEndpoint.Port     The port number of the configuration endpoint for the Memcached cache cluster.
        AWS::ElastiCache::CacheCluster                                         RedisEndpoint.Address          The DNS address of the configuration endpoint for the Redis cache cluster.

                                                                                                            Example:?test.abc12a.cfg.use1.cache.amazonaws.com:11111
        AWS::ElastiCache::CacheCluster                                         RedisEndpoint.Port             The port number of the configuration endpoint for the Redis cache cluster.
        AWS::ElastiCache::ReplicationGroup                                     ConfigurationEndPoint.Address  The DNS hostname of the cache node.
        AWS::ElastiCache::ReplicationGroup                                     ConfigurationEndPoint.Port     The port number that the cache engine is listening on.
        AWS::ElastiCache::ReplicationGroup                                     PrimaryEndPoint.Address        The DNS address of the primary read-write cache node.
        AWS::ElastiCache::ReplicationGroup                                     PrimaryEndPoint.Port           The port number that the primary read-write cache engine is listening on.
        AWS::ElastiCache::ReplicationGroup                                     ReadEndPoint.Addresses         A string with a list of endpoints for the read-only replicas. The order of the addresses map to the order of the ports from the?ReadEndPoint.Ports...

                                                                                                            Example:?"[abc12xmy3d1w3hv6-001.rep12a.0001.use1.cache.amazonaws.com, abc12xmy3d1w3hv6-002.rep12a.0001.use1.cache.amazonaws.com, abc12xmy3d1w3hv6-...
        AWS::ElastiCache::ReplicationGroup                                     ReadEndPoint.Ports             A string with a list of ports for the read-only replicas. The order of the ports maps to the order of the addresses from the?ReadEndPoint.Addresse...

                                                                                                            Example:?"[6379, 6379, 6379]"
        AWS::ElastiCache::ReplicationGroup                                     ReadEndPoint.Addresses.List    A list of endpoints for the read-only replicas.

                                                                                                            Example:?["abc12xmy3d1w3hv6-001.rep12a.0001.use1.cache.amazonaws.com", "abc12xmy3d1w3hv6-002.rep12a.0001.use1.cache.amazonaws.com", "abc12xmy3d1w3...
        AWS::ElastiCache::ReplicationGroup                                     ReadEndPoint.Ports.List        A list of ports for the read-only replicas.

                                                                                                            Example:?["6379","6379","6379"]
        AWS::ElasticBeanstalk::Environment                                     EndpointURL                    The URL to the load balancer for this environment.

                                                                                                            Example:?awseb-myst-myen-132MQC4KRLAMD-1371280482.us-east-1.elb.amazonaws.com
        AWS::ElasticLoadBalancing::LoadBalancer                                CanonicalHostedZoneName        The name of the Amazon Route?53-hosted zone that is associated with the load balancer.

                                                                                                            Example:?mystack-myelb-15HMABG9ZCN57-1013119603.us-east-1.elb.amazonaws.com
        AWS::ElasticLoadBalancing::LoadBalancer                                CanonicalHostedZoneNameID      The ID of the Amazon Route?53 hosted zone name that is associated with the l oad balancer.

                                                                                                            Example:?Z3DZXE0Q79N41H
        AWS::ElasticLoadBalancing::LoadBalancer                                DNSName                        The DNS name for the load balancer.

                                                                                                            Example:?mystack-myelb-15HMABG9ZCN57-1013119603.us-east-1.elb.amazonaws.com
        AWS::ElasticLoadBalancing::LoadBalancer                                SourceSecurityGroup.GroupName  The security group that you can use as part of your inbound rules for your load balancer's back-end Amazon EC2 application instances.

                                                                                                            Example:?amazon-elb
        AWS::ElasticLoadBalancing::LoadBalancer                                SourceSecurityGroup.OwnerAlias The owner of the source security group.

                                                                                                            Example:?amazon-elb-sg
        AWS::ElasticLoadBalancingV2::LoadBalancer                              DNSName                        The DNS name for the application load balancer.

                                                                                                            Example:?my-load-balancer-424835706.us-west-2.elb.amazonaws.com
        AWS::ElasticLoadBalancingV2::LoadBalancer                              CanonicalHostedZoneID          The ID of the Amazon Route?53-hosted zone name that is associated with the load balancer.

                                                                                                            Example:?Z2P70J7EXAMPLE
        AWS::ElasticLoadBalancingV2::LoadBalancer                              LoadBalancerFullName           The full name of the application load balancer.

                                                                                                            Example:?app/my-load-balancer/50dc6c495c0c9188
        AWS::ElasticLoadBalancingV2::LoadBalancer                              LoadBalancerName               The name of the application load balancer.

                                                                                                            Example:?my-load-balancer
        AWS::ElasticLoadBalancingV2::LoadBalancer                              SecurityGroups                 The IDs of the security groups for the application load balancer.

                                                                                                            Example:?sg-123456a
        AWS::ElasticLoadBalancingV2::TargetGroup                               LoadBalancerArns               The Amazon Resource Names (ARNs) of the load balancers that route traffic to this target group.

                                                                                                            Example:?[ "arn:aws:elasticloadbalancing:us-west-2:123456789012:loadbalancer/app/my-load-balancer/50dc6c495c0c9188" ]
        AWS::ElasticLoadBalancingV2::TargetGroup                               TargetGroupFullName            The full name of the target group.
                                                                                                            Example:?targetgroup/my-target-group/cbf133c568e0d028
        AWS::Elasticsearch::Domain                                             DomainArn                      The Amazon Resource Name (ARN) of the domain.

                                                                                                            Example:?arn:aws:es:us-west-2:123456789012:domain/mystack-elasti-1ab2cdefghij
        AWS::Elasticsearch::Domain                                             DomainEndpoint                 The domain-specific endpoint that is used to submit index, search, and data upload requests to an Amazon Elasticsearch Service domain.

                                                                                                            Example:?search-mystack-elasti-1ab2cdefghij-ab1c2deckoyb3hofw7wpqa3cm.us-west-2.es.amazonaws.com
        AWS::EMR::Cluster                                                      MasterPublicDNS                The public DNS name of the master node (instance).

                                                                                                            Example:?ec2-12-123-123-123.us-west-2.compute.amazonaws.com
        AWS::Events::Rule                                                      Arn                            The Amazon Resource Name (ARN) of the event rule.

                                                                                                            Example:?arn:aws:events:us-east-1:123456789012:rule/example
        AWS::IAM::AccessKey                                                    SecretAccessKey                The secret access key for the specified?Access Key.

                                                                                                            Example:?wJalrXUtnFEMI/K7MDENG/bPxRfiCYzEXAMPLEKEY
        AWS::IAM::Group                                                        Arn                            Example:?arn:aws:iam::123456789012:group/mystack-mygroup-1DZETITOWEKVO
        AWS::IAM::InstanceProfile                                              Arn                            Returns the Amazon Resource Name (ARN) for the instance profile.

                                                                                                            Example:?arn:aws:iam::1234567890:instance-profile/MyProfile-ASDNSDLKJ
        AWS::IAM::Role                                                         Arn                            Example:?arn:aws:iam::1234567890:role/MyRole-AJJHDSKSDF
        AWS::IAM::User                                                         Arn                            Example:?arn:aws:iam::123456789012:user/mystack-myuser-1CCXAFG2H2U4D
        AWS::IoT::Certificate                                                  Arn                            Example:?arn:aws:iot:ap-southeast-2:123456789012:cert/a1234567b89c012d3e4fg567hij8k9l01mno1p23q45678901rs234567890t1u2
        AWS::Kinesis::Stream                                                   Arn                            The ARN of the Amazon Kinesis stream.

                                                                                                            Example:?arn:aws:kinesis:us-east-1:123456789012:stream/mystream.
        AWS::KMS::Key                                                          Arn                            The ARN of the AWS KMS key.

                                                                                                            Example:?arn:aws:kms:us-west-2:123456789012:key/12a34567-8c90-1defg-af84-0bf06c1747f3.
        AWS::Lambda::Function                                                  Arn                            Example:?arn:aws:lambda:us-west-2:123456789012:MyStack-AMILookUp-NT5EUXTNTXXD
        AWS::Lambda::Version                                                   Version                        The version of a Lambda function.

                                                                                                            Example:?1
        AWS::Logs::LogGroup                                                    Arn                            The ARN of the Amazon CloudWatch Logs log group.

                                                                                                            Example:?arn:aws:logs:us-east-1:123456789012:log-group:/mystack-testgroup-12ABC1AB12A1:*
        AWS::OpsWorks::Instance                                                AvailabilityZone               The Availability Zone of an AWS OpsWorks instance.

                                                                                                            Example:?us-east-2a.
        AWS::OpsWorks::Instance                                                PrivateDnsName                 The private DNS name of an AWS OpsWorks instance.
        AWS::OpsWorks::Instance                                                PrivateIp                      The private IP address of an AWS OpsWorks instance.
        AWS::OpsWorks::Instance                                                PublicDnsName                  The public DNS name of an AWS OpsWorks instance.
        AWS::OpsWorks::Instance                                                PublicIp                       The public IP address of an AWS OpsWorks instance.

                                                                                                            Note
                                                                                                            To use this attribute, the AWS OpsWorks instance must be in an AWS OpsWorks layer that auto-assigns public IP addresses.

                                                                                                            Example:?192.0.2.0
        AWS::OpsWorks::UserProfile                                             SshUserName                    The SSH user name of an AWS OpsWorks instance.
        AWS::Redshift::Cluster                                                 Endpoint.Address               The connection endpoint for the cluster.

                                                                                                            Example:?examplecluster.cg034hpkmmjt.us-east-1.redshift.amazonaws.com
        AWS::Redshift::Cluster                                                 Endpoint.Port                  The connection port for the cluster.

                                                                                                            Example:?5439
        AWS::RDS::DBCluster                                                    Endpoint.Address               The connection endpoint for the DB cluster.

                                                                                                            Example:?mystack-mydbcluster-1apw1j4phylrk.cg034hpkmmjt.us-east-1.rds.amazonaws.com
        AWS::RDS::DBCluster                                                    Endpoint.Port                  The port number on which the DB cluster accepts connections.

                                                                                                            Example:?3306
        AWS::RDS::DBInstance                                                   Endpoint.Address               The connection endpoint for the database.

                                                                                                            Example:?mystack-mydb-1apw1j4phylrk.cg034hpkmmjt.us-east-1.rds.amazonaws.com
        AWS::RDS::DBInstance                                                   Endpoint.Port                  The port number on which the database accepts connections.

                                                                                                            Example:?3306
        AWS::Route53::HostedZone                                               NameServers                    Returns the set of name servers for the specific hosted zone.

                                                                                                            Example:?ns1.example.com
        AWS::S3::Bucket                                                        DomainName                     The DNS name of the specified bucket.

                                                                                                            Example:?mystack-mybucket-kdwwxmddtr2g.s3.amazonaws.com
        AWS::S3::Bucket                                                        WebsiteURL                     The Amazon S3 website endpoint for the specified bucket.

                                                                                                            Example:?http://mystack-mybucket-kdwwxmddtr2g.s3-website-us-east-1.amazonaws.com/
        AWS::Serverless::Function                                              No attribute.                  The ARN of an?AWS::Serverless::Function?resource.
        AWS::SNS::Topic                                                        TopicName                      The name of an Amazon SNS topic.

                                                                                                            Example:?my-sns-topic
        AWS::StepFunctions::Activity                                           Name                           The name of the AWS Step Functions activity.
        AWS::StepFunctions::StateMachine                                       Name                           The name of the Step Functions state machine.
        AWS::SQS::Queue                                                        Arn                            The ARN for the specified queue.

                                                                                                            Example:?arn:aws:sqs:us-east-1:123456789012:mystack-myqueue-15PG5C2FC1CW8
        AWS::SQS::Queue                                                        QueueName                      The name of an Amazon SQS queue.

                                                                                                            Example:?mystack-myqueue-1VF9BKQH5BJVI

    .FUNCTIONALITY
        Vaporshell
    #>
    [OutputType([FnGetAtt])]
    [cmdletbinding()]
    Param(
        [parameter(Mandatory,Position = 0)]
        [string]
        $LogicalNameOfResource,
        [parameter(Mandatory,Position = 1)]
        [string]
        $AttributeName
    )
    $obj = [FnGetAtt]::new($LogicalNameOfResource,$AttributeName)
    Write-Verbose "Resulting JSON from $($MyInvocation.MyCommand): `n$($obj.ToJson() | Format-Json)"
    $obj
}
