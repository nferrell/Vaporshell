function Add-VSS3BucketNotificationFilter {
    <#
    .SYNOPSIS
        Adds an AWS::S3::Bucket.NotificationFilter resource property to the template. Specifies object key name filtering rules. For information about key name filtering, see Configuring Event Notifications: https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html in the *Amazon Simple Storage Service Developer Guide*.

    .DESCRIPTION
        Adds an AWS::S3::Bucket.NotificationFilter resource property to the template.
Specifies object key name filtering rules. For information about key name filtering, see Configuring Event Notifications: https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html in the *Amazon Simple Storage Service Developer Guide*.

    .LINK
        http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-bucket-notificationconfiguration-config-filter.html

    .PARAMETER S3Key
        A container for object key name prefix and suffix filtering rules.

        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-bucket-notificationconfiguration-config-filter.html#cfn-s3-bucket-notificationconfiguraiton-config-filter-s3key
        Type: S3KeyFilter
        UpdateType: Mutable

    .FUNCTIONALITY
        Vaporshell
    #>
    [OutputType('Vaporshell.Resource.S3.Bucket.NotificationFilter')]
    [cmdletbinding()]
    Param
    (
        [parameter(Mandatory = $true)]
        $S3Key
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
        $obj | Add-ObjectDetail -TypeName 'Vaporshell.Resource.S3.Bucket.NotificationFilter'
        Write-Verbose "Resulting JSON from $($MyInvocation.MyCommand): `n`n$($obj | ConvertTo-Json -Depth 5)`n"
    }
}
