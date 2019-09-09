function Add-VSKinesisFirehoseDeliveryStreamDataFormatConversionConfiguration {
    <#
    .SYNOPSIS
        Adds an AWS::KinesisFirehose::DeliveryStream.DataFormatConversionConfiguration resource property to the template

    .DESCRIPTION
        Adds an AWS::KinesisFirehose::DeliveryStream.DataFormatConversionConfiguration resource property to the template

    .LINK
        http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-deliverystream-dataformatconversionconfiguration.html

    .PARAMETER Enabled
        Defaults to true. Set it to false if you want to disable format conversion while preserving the configuration details.

        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-deliverystream-dataformatconversionconfiguration.html#cfn-kinesisfirehose-deliverystream-dataformatconversionconfiguration-enabled
        PrimitiveType: Boolean
        UpdateType: Mutable

    .PARAMETER InputFormatConfiguration
        Specifies the deserializer that you want Kinesis Data Firehose to use to convert the format of your data from JSON.

        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-deliverystream-dataformatconversionconfiguration.html#cfn-kinesisfirehose-deliverystream-dataformatconversionconfiguration-inputformatconfiguration
        Type: InputFormatConfiguration
        UpdateType: Mutable

    .PARAMETER OutputFormatConfiguration
        Specifies the serializer that you want Kinesis Data Firehose to use to convert the format of your data to the Parquet or ORC format.

        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-deliverystream-dataformatconversionconfiguration.html#cfn-kinesisfirehose-deliverystream-dataformatconversionconfiguration-outputformatconfiguration
        Type: OutputFormatConfiguration
        UpdateType: Mutable

    .PARAMETER SchemaConfiguration
        Specifies the AWS Glue Data Catalog table that contains the column information.

        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-deliverystream-dataformatconversionconfiguration.html#cfn-kinesisfirehose-deliverystream-dataformatconversionconfiguration-schemaconfiguration
        Type: SchemaConfiguration
        UpdateType: Mutable

    .FUNCTIONALITY
        Vaporshell
    #>
    [OutputType('Vaporshell.Resource.KinesisFirehose.DeliveryStream.DataFormatConversionConfiguration')]
    [cmdletbinding()]
    Param
    (
        [parameter(Mandatory = $true)]
        [System.Boolean]
        $Enabled,
        [parameter(Mandatory = $true)]
        $InputFormatConfiguration,
        [parameter(Mandatory = $true)]
        $OutputFormatConfiguration,
        [parameter(Mandatory = $true)]
        $SchemaConfiguration
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
        $obj | Add-ObjectDetail -TypeName 'Vaporshell.Resource.KinesisFirehose.DeliveryStream.DataFormatConversionConfiguration'
        Write-Verbose "Resulting JSON from $($MyInvocation.MyCommand): `n`n$($obj | ConvertTo-Json -Depth 5)`n"
    }
}