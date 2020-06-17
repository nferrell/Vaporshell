function Add-UpdatePolicy {
    <#
    .SYNOPSIS
        Adds an UpdatePolicy property to a resoure on the template

    .DESCRIPTION
        Use the UpdatePolicy attribute to specify how AWS CloudFormation handles updates to the AWS::AutoScaling::AutoScalingGroup resource. AWS CloudFormation invokes one of three update policies depending on the type of change you make or whether a scheduled action is associated with the Auto Scaling group.

        * The AutoScalingReplacingUpdate and AutoScalingRollingUpdate policies apply only when you do one or more of the following:
            * Change the Auto Scaling group's AWS::AutoScaling::LaunchConfiguration.
            * Change the Auto Scaling group's VPCZoneIdentifier property
            * Update an Auto Scaling group that contains instances that don't match the current LaunchConfiguration.
        * If both the AutoScalingReplacingUpdate and AutoScalingRollingUpdate policies are specified, setting the WillReplace property to true gives AutoScalingReplacingUpdate precedence.
        * The AutoScalingScheduledAction policy applies when you update a stack that includes an Auto Scaling group with an associated scheduled action.

    .LINK
        http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-updatepolicy.html

    .PARAMETER AutoScalingReplacingUpdate
        To specify how AWS CloudFormation handles replacement updates for an Auto Scaling group, use the AutoScalingReplacingUpdate policy. This policy enables you to specify whether AWS CloudFormation replaces an Auto Scaling group with a new one or replaces only the instances in the Auto Scaling group.

            **Important**
                Before attempting an update, ensure that you have sufficient Amazon EC2 capacity for both your old and new Auto Scaling groups.

        Parameter accepts a PSCustomObject. Use this if you are customizing the AutoScalingReplacingUpdate properties outside of WillReplace.

    .PARAMETER WillReplace
        Specifies whether an Auto Scaling group and the instances it contains are replaced during an update. During replacement, AWS CloudFormation retains the old group until it finishes creating the new one. If the update fails, AWS CloudFormation can roll back to the old Auto Scaling group and delete the new Auto Scaling group.

        While AWS CloudFormation creates the new group, it doesn't detach or attach any instances. After successfully creating the new Auto Scaling group, AWS CloudFormation deletes the old Auto Scaling group during the cleanup process.

        When you set the WillReplace parameter, remember to specify a matching CreationPolicy. If the minimum number of instances (specified by the WillReplace property) don't signal success within the Timeout period (specified in the CreationPolicy policy), the replacement update fails and AWS CloudFormation rolls back to the old Auto Scaling group.

    .PARAMETER AutoScalingRollingUpdate
        To specify how AWS CloudFormation handles rolling updates for an Auto Scaling group, use the AutoScalingRollingUpdate policy. Rolling updates enable you to specify whether AWS CloudFormation updates instances that are in an Auto Scaling group in batches or all at once.

            **Important**
                During a rolling update, some Auto Scaling processes might make changes to the Auto Scaling group before AWS CloudFormation completes the rolling update. These changes might cause the rolling update to fail. To prevent Auto Scaling from running processes during a rolling update, use the SuspendProcesses property.

        Parameter accepts a PSCustomObject. Use this if you are customizing the AutoScalingRollingUpdate properties outside of MaxBatchSize, MinInstancesInService, WillReplace, PauseTime, SuspendProcesses, and/or WaitOnAutoScalingRollingUpdates.

    .PARAMETER MaxBatchSize
        Specifies the maximum number of instances that AWS CloudFormation updates.

    .PARAMETER MinInstancesInService
        Specifies the minimum number of instances that must be in service within the Auto Scaling group while AWS CloudFormation updates old instances.

    .PARAMETER WillReplace
        Specifies the percentage of instances in an Auto Scaling rolling update that must signal success for an update to succeed. You can specify a value from 0 to 100. AWS CloudFormation rounds to the nearest tenth of a percent. For example, if you update five instances with a minimum successful percentage of 50, three instances must signal success.

        If an instance doesn't send a signal within the time specified in the PauseTime property, AWS CloudFormation assumes that the instance wasn't updated.

        If you specify this property, you must also enable the WaitOnAutoScalingRollingUpdates and PauseTime properties.

    .PARAMETER PauseTime
        The amount of time that AWS CloudFormation pauses after making a change to a batch of instances to give those instances time to start software applications. For example, you might need to specify PauseTime when scaling up the number of instances in an Auto Scaling group.

        If you enable the WaitOnAutoScalingRollingUpdates property, PauseTime is the amount of time that AWS CloudFormation should wait for the Auto Scaling group to receive the required number of valid signals from added or replaced instances. If the PauseTime is exceeded before the Auto Scaling group receives the required number of signals, the update fails. For best results, specify a time period that gives your applications sufficient time to get started. If the update needs to be rolled back, a short PauseTime can cause the rollback to fail.

        Specify PauseTime in the ISO8601 duration format (in the format PT#H#M#S, where each # is the number of hours, minutes, and seconds, respectively). The maximum PauseTime is one hour (PT1H).

        Default: PT0S (zero seconds). If the WaitOnAutoScalingRollingUpdates property is set to true, the default is PT5M.

    .PARAMETER SuspendProcesses
        Specifies the Auto Scaling processes to suspend during a stack update. Suspending processes prevents Auto Scaling from objecterfering with a stack update. For example, you can suspend alarming so that Auto Scaling doesn't execute scaling policies associated with an alarm. For valid values, see the `ScalingProcesses.member.N parameter` for the SuspendProcesses action in the Auto Scaling API Reference.

    .PARAMETER WaitOnAutoScalingRollingUpdates
        Specifies whether the Auto Scaling group waits on signals from new instances during an update. Use this property to ensure that instances have completed installing and configuring applications before the Auto Scaling group update proceeds. AWS CloudFormation suspends the update of an Auto Scaling group after new EC2 instances are launched objecto the group. AWS CloudFormation must receive a signal from each new instance within the specified PauseTime before continuing the update. To signal the Auto Scaling group, use the cfn-signal helper script or SignalResource API.

        To have instances wait for an Elastic Load Balancing health check before they signal success, add a health-check verification by using the cfn-init helper script. For an example, see the `verify_instance_health` command in the Auto Scaling rolling updates sample template.

    .PARAMETER AutoScalingScheduledAction
        To specify how AWS CloudFormation handles updates for the MinSize, MaxSize, and DesiredCapacity properties when the AWS::AutoScaling::AutoScalingGroup resource has an associated scheduled action, use the AutoScalingScheduledAction policy.

        With scheduled actions, the group size properties of an Auto Scaling group can change at any time. When you update a stack with an Auto Scaling group and scheduled action, AWS CloudFormation always sets the group size property values of your Auto Scaling group to the values that are defined in the AWS::AutoScaling::AutoScalingGroup resource of your template, even if a scheduled action is in effect.

        If you do not want AWS CloudFormation to change any of the group size property values when you have a scheduled action in effect, use the AutoScalingScheduledAction update policy to prevent AWS CloudFormation from changing the MinSize, MaxSize, or DesiredCapacity properties unless you have modified these values in your template.

        Parameter accepts a PSCustomObject. Use this if you are customizing the AutoScalingScheduledAction properties outside of IgnoreUnmodifiedGroupSizeProperties.

    .PARAMETER IgnoreUnmodifiedGroupSizeProperties
        Specifies whether AWS CloudFormation ignores differences in group size properties between your current Auto Scaling group and the Auto Scaling group described in the AWS::AutoScaling::AutoScalingGroup resource of your template during a stack update. If you modify any of the group size property values in your template, AWS CloudFormation uses the modified values and updates your Auto Scaling group.

    .EXAMPLE
        $templateInit = Initialize-Vaporshell -Description "Testing"
        $templateInit.AddResource(
            (
                New-VaporResource -LogicalId "AutoScalingGroup" -Type "AWS::AutoScaling::AutoScalingGroup" -Properties ([PSCustomObject][Ordered]@{
                        "AvailabilityZones"       = (Add-FnGetAZs -Region "$_AWSRegion")
                        "LaunchConfigurationName" = (Add-FnRef -Ref "LaunchConfig")
                        "DesiredCapacity"         = "3"
                        "MinSize"                 = "1"
                        "MaxSize"                 = "4"
                    }) -CreationPolicy (Add-CreationPolicy -Count 3 -Timeout "PT15M") -UpdatePolicy (Add-UpdatePolicy -IgnoreUnmodifiedGroupSizeProperties True -MinInstancesInService 1 -MaxBatchSize 2 -WaitOnResourceSignals True -PauseTime "PT10M")
            )
        )

        When the template is exported, this will convert to:
```json
{
    "AWSTemplateFormatVersion": "2010-09-09",
    "Description": "Testing",
    "Resources": {
        "AutoScalingGroup": {
            "Type": "AWS::AutoScaling::AutoScalingGroup",
            "Properties": {
                "AvailabilityZones": {
                    "Fn::GetAZs": "AWS::Region"
                },
                "LaunchConfigurationName": {
                    "Ref": "LaunchConfig"
                },
                "DesiredCapacity": "3",
                "MinSize": "1",
                "MaxSize": "4"
            },
            "CreationPolicy": {
                "ResourceSignal": {
                    "Count": "3",
                    "Timeout": "PT15M"
                }
            },
            "UpdatePolicy": {
                "AutoScalingScheduledAction": {
                    "IgnoreUnmodifiedGroupSizeProperties": "true"
                },
                "AutoScalingRollingUpdate": {
                    "MinInstancesInService": "1",
                    "MaxBatchSize": "2",
                    "WaitOnResourceSignals": "true",
                    "PauseTime": "PT10M"
                }
            }
        }
    }
}
```
    .FUNCTIONALITY
        Vaporshell
    #>
    [OutputType([UpdatePolicy])]
    [cmdletbinding(DefaultParameterSetName="AutoScalingRollingUpdateDetails")]
    Param(
        [parameter(ParameterSetName="AutoScalingReplacingUpdate")]
        [parameter(ParameterSetName="AutoScalingRollingUpdate")]
        [parameter(ParameterSetName="AutoScalingRollingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingScheduledAction")]
        [parameter(ParameterSetName="AutoScalingScheduledActionDetails")]
        [AutoScalingReplacingUpdate]
        $AutoScalingReplacingUpdate,
        [parameter(ParameterSetName="AutoScalingReplacingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingRollingUpdate")]
        [parameter(ParameterSetName="AutoScalingRollingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingScheduledAction")]
        [object]
        $WillReplace,
        [parameter(ParameterSetName="AutoScalingReplacingUpdate")]
        [parameter(ParameterSetName="AutoScalingReplacingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingRollingUpdate")]
        [parameter(ParameterSetName="AutoScalingScheduledAction")]
        [AutoScalingRollingUpdate]
        $AutoScalingRollingUpdate,
        [parameter(ParameterSetName="AutoScalingReplacingUpdate")]
        [parameter(ParameterSetName="AutoScalingReplacingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingRollingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingScheduledAction")]
        [parameter(ParameterSetName="AutoScalingScheduledActionDetails")]
        [object]
        $MaxBatchSize,
        [parameter(ParameterSetName="AutoScalingReplacingUpdate")]
        [parameter(ParameterSetName="AutoScalingReplacingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingRollingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingScheduledAction")]
        [parameter(ParameterSetName="AutoScalingScheduledActionDetails")]
        [object]
        $MinInstancesInService,
        [parameter(ParameterSetName="AutoScalingReplacingUpdate")]
        [parameter(ParameterSetName="AutoScalingReplacingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingRollingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingScheduledAction")]
        [parameter(ParameterSetName="AutoScalingScheduledActionDetails")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdate")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdateDetails")]
        [object]
        $MinSuccessfulInstancesPercent,
        [parameter(ParameterSetName="AutoScalingReplacingUpdate")]
        [parameter(ParameterSetName="AutoScalingReplacingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingRollingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingScheduledAction")]
        [parameter(ParameterSetName="AutoScalingScheduledActionDetails")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdate")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdateDetails")]
        [object]
        $PauseTime,
        [parameter(ParameterSetName="AutoScalingReplacingUpdate")]
        [parameter(ParameterSetName="AutoScalingReplacingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingRollingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingScheduledAction")]
        [parameter(ParameterSetName="AutoScalingScheduledActionDetails")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdate")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdateDetails")]
        [AutoScalingProcess[]]
        $SuspendProcesses,
        [parameter(ParameterSetName="AutoScalingReplacingUpdate")]
        [parameter(ParameterSetName="AutoScalingReplacingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingRollingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingScheduledAction")]
        [parameter(ParameterSetName="AutoScalingScheduledActionDetails")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdate")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdateDetails")]
        [object]
        $WaitOnResourceSignals,
        [parameter(ParameterSetName="AutoScalingReplacingUpdate")]
        [parameter(ParameterSetName="AutoScalingReplacingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingRollingUpdate")]
        [parameter(ParameterSetName="AutoScalingRollingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingScheduledAction")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdate")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdateDetails")]
        [AutoScalingScheduledAction]
        $AutoScalingScheduledAction,
        [parameter(ParameterSetName="AutoScalingReplacingUpdate")]
        [parameter(ParameterSetName="AutoScalingReplacingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingRollingUpdate")]
        [parameter(ParameterSetName="AutoScalingRollingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingScheduledActionDetails")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdate")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdateDetails")]
        [object]
        $IgnoreUnmodifiedGroupSizeProperties,
        [parameter(ParameterSetName="AutoScalingReplacingUpdate")]
        [parameter(ParameterSetName="AutoScalingReplacingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingRollingUpdate")]
        [parameter(ParameterSetName="AutoScalingRollingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingScheduledAction")]
        [parameter(ParameterSetName="AutoScalingScheduledActionDetails")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdate")]
        [CodeDeployLambdaAliasUpdate]
        $CodeDeployLambdaAliasUpdate,
        [parameter(ParameterSetName="AutoScalingReplacingUpdate")]
        [parameter(ParameterSetName="AutoScalingReplacingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingRollingUpdate")]
        [parameter(ParameterSetName="AutoScalingRollingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingScheduledAction")]
        [parameter(ParameterSetName="AutoScalingScheduledActionDetails")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdateDetails")]
        [object]
        $AfterAllowTrafficHook,
        [parameter(ParameterSetName="AutoScalingReplacingUpdate")]
        [parameter(ParameterSetName="AutoScalingReplacingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingRollingUpdate")]
        [parameter(ParameterSetName="AutoScalingRollingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingScheduledAction")]
        [parameter(ParameterSetName="AutoScalingScheduledActionDetails")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdateDetails")]
        [object]
        $ApplicationName,
        [parameter(ParameterSetName="AutoScalingReplacingUpdate")]
        [parameter(ParameterSetName="AutoScalingReplacingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingRollingUpdate")]
        [parameter(ParameterSetName="AutoScalingRollingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingScheduledAction")]
        [parameter(ParameterSetName="AutoScalingScheduledActionDetails")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdateDetails")]
        [object]
        $BeforeAllowTrafficHook,
        [parameter(ParameterSetName="AutoScalingReplacingUpdate")]
        [parameter(ParameterSetName="AutoScalingReplacingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingRollingUpdate")]
        [parameter(ParameterSetName="AutoScalingRollingUpdateDetails")]
        [parameter(ParameterSetName="AutoScalingScheduledAction")]
        [parameter(ParameterSetName="AutoScalingScheduledActionDetails")]
        [parameter(ParameterSetName="CodeDeployLambdaAliasUpdateDetails")]
        [object]
        $DeploymentGroupName
    )
    Begin {
        if (!($PSBoundParameters.Keys.Count)) {
            $PSCmdlet.ThrowTerminatingError((New-VSError -object "No parameters passed! Please specify at least one parameter, otherwise exclude this call of $($MyInvocation.MyCommand)."))
        }
        $obj = [UpdatePolicy]::new()
        $ASRepU = [AutoScalingReplacingUpdate]::new()
        $ASRolU = [AutoScalingRollingUpdate]::new()
        $ASSA = [AutoScalingScheduledAction]::new()
        $ASSA = [AutoScalingScheduledAction]::new()
        $CDLA = [CodeDeployLambdaAliasUpdate]::new()
    }
    Process {
        switch ($PSBoundParameters.Keys) {
            'AutoScalingReplacingUpdate' {
                $obj.AutoScalingReplacingUpdate = $AutoScalingReplacingUpdate
            }
            'WillReplace' {
                $ASRepU.WillReplace = $WillReplace
                $obj.AutoScalingReplacingUpdate = $ASRepU
            }
            'AutoScalingRollingUpdate' {
                $obj.AutoScalingRollingUpdate = $AutoScalingRollingUpdate
            }
            'MaxBatchSize' {
                $ASRolU.MaxBatchSize = $MaxBatchSize
            }
            'MinInstancesInService' {
                $ASRolU.MinInstancesInService = $MinInstancesInService
            }
            'MinSuccessfulInstancesPercent' {
                $ASRolU.MinSuccessfulInstancesPercent = $MinSuccessfulInstancesPercent
            }
            'PauseTime' {
                $ASRolU.PauseTime = $PauseTime
            }
            'SuspendProcesses' {
                $ASRolU.SuspendProcesses = $SuspendProcesses
            }
            'WaitOnResourceSignals' {
                $ASRolU.WaitOnResourceSignals = $WaitOnResourceSignals
            }
            'AutoScalingScheduledAction' {
                $obj.AutoScalingScheduledAction = $AutoScalingScheduledAction
            }
            'IgnoreUnmodifiedGroupSizeProperties' {
                $ASSA.IgnoreUnmodifiedGroupSizeProperties = $IgnoreUnmodifiedGroupSizeProperties
                $obj.AutoScalingScheduledAction = $ASSA
            }
            'CodeDeployLambdaAliasUpdate' {
                $obj.CodeDeployLambdaAliasUpdate = $CodeDeployLambdaAliasUpdate
            }
            'AfterAllowTrafficHook' {
                $CDLA.AfterAllowTrafficHook = $AfterAllowTrafficHook
            }
            'ApplicationName' {
                $CDLA.ApplicationName = $ApplicationName
            }
            'BeforeAllowTrafficHook' {
                $CDLA.BeforeAllowTrafficHook = $BeforeAllowTrafficHook
            }
            'DeploymentGroupName' {
                $CDLA.DeploymentGroupName = $DeploymentGroupName
            }
        }
        foreach ($prop in @('MaxBatchSize','MinInstancesInService','MinSuccessfulInstancesPercent','PauseTime','SuspendProcesses','WaitOnResourceSignals')) {
            if ($prop -in $PSBoundParameters.Keys) {
                $obj.AutoScalingRollingUpdate = $ASRolU
                break
            }
        }
        foreach ($prop in @('AfterAllowTrafficHook','ApplicationName','BeforeAllowTrafficHook','DeploymentGroupName')) {
            if ($prop -in $PSBoundParameters.Keys) {
                $obj.CodeDeployLambdaAliasUpdate = $CDLA
                break
            }
        }
    }
    End {
        Write-Verbose "Resulting JSON from $($MyInvocation.MyCommand): `n$($obj.ToJson() | Format-Json)"
        $obj
    }
}
