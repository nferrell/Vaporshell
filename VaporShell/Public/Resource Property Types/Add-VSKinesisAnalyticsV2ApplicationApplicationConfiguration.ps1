function Add-VSKinesisAnalyticsV2ApplicationApplicationConfiguration {
    <#
    .SYNOPSIS
        Adds an AWS::KinesisAnalyticsV2::Application.ApplicationConfiguration resource property to the template. Specifies the creation parameters for an Amazon Kinesis Data Analytics application.

    .DESCRIPTION
        Adds an AWS::KinesisAnalyticsV2::Application.ApplicationConfiguration resource property to the template.
Specifies the creation parameters for an Amazon Kinesis Data Analytics application.

    .LINK
        http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisanalyticsv2-application-applicationconfiguration.html

    .PARAMETER ApplicationCodeConfiguration
        The code location and type parameters for a Java-based Kinesis Data Analytics application.

        Type: ApplicationCodeConfiguration
        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisanalyticsv2-application-applicationconfiguration.html#cfn-kinesisanalyticsv2-application-applicationconfiguration-applicationcodeconfiguration
        UpdateType: Mutable

    .PARAMETER EnvironmentProperties
        Describes execution properties for a Java-based Kinesis Data Analytics application.

        Type: EnvironmentProperties
        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisanalyticsv2-application-applicationconfiguration.html#cfn-kinesisanalyticsv2-application-applicationconfiguration-environmentproperties
        UpdateType: Mutable

    .PARAMETER FlinkApplicationConfiguration
        The creation and update parameters for a Java-based Kinesis Data Analytics application.

        Type: FlinkApplicationConfiguration
        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisanalyticsv2-application-applicationconfiguration.html#cfn-kinesisanalyticsv2-application-applicationconfiguration-flinkapplicationconfiguration
        UpdateType: Mutable

    .PARAMETER SqlApplicationConfiguration
        The creation and update parameters for an SQL-based Kinesis Data Analytics application.

        Type: SqlApplicationConfiguration
        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisanalyticsv2-application-applicationconfiguration.html#cfn-kinesisanalyticsv2-application-applicationconfiguration-sqlapplicationconfiguration
        UpdateType: Mutable

    .PARAMETER ApplicationSnapshotConfiguration
        Describes whether snapshots are enabled for a Java-based Kinesis Data Analytics application.

        Type: ApplicationSnapshotConfiguration
        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisanalyticsv2-application-applicationconfiguration.html#cfn-kinesisanalyticsv2-application-applicationconfiguration-applicationsnapshotconfiguration
        UpdateType: Mutable

    .FUNCTIONALITY
        Vaporshell
    #>
    [OutputType('Vaporshell.Resource.KinesisAnalyticsV2.Application.ApplicationConfiguration')]
    [cmdletbinding()]
    Param
    (
        [parameter(Mandatory = $false)]
        $ApplicationCodeConfiguration,
        [parameter(Mandatory = $false)]
        $EnvironmentProperties,
        [parameter(Mandatory = $false)]
        $FlinkApplicationConfiguration,
        [parameter(Mandatory = $false)]
        $SqlApplicationConfiguration,
        [parameter(Mandatory = $false)]
        $ApplicationSnapshotConfiguration
    )
    Begin {
        $obj = [PSCustomObject]@{}
        $commonParams = @('Verbose','Debug','ErrorAction','WarningAction','InformationAction','ErrorVariable','WarningVariable','InformationVariable','OutVariable','OutBuffer','PipelineVariable')
    }
    Process {
        foreach ($key in $PSBoundParameters.Keys | Where-Object {$commonParams -notcontains $_}) {
            switch ($key) {
                Default {
                    $obj | Add-Member -MemberType NoteProperty -Name $key -Value $PSBoundParameters.$key
                }
            }
        }
    }
    End {
        $obj | Add-ObjectDetail -TypeName 'Vaporshell.Resource.KinesisAnalyticsV2.Application.ApplicationConfiguration'
        Write-Verbose "Resulting JSON from $($MyInvocation.MyCommand): `n`n$($obj | ConvertTo-Json -Depth 5)`n"
    }
}
