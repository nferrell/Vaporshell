function Add-VSRoute53HostedZoneHostedZoneTag {
    <#
    .SYNOPSIS
        Adds an AWS::Route53::HostedZone.HostedZoneTag resource property to the template. A complex type that contains information about a tag that you want to add or edit for the specified health check or hosted zone.

    .DESCRIPTION
        Adds an AWS::Route53::HostedZone.HostedZoneTag resource property to the template.
A complex type that contains information about a tag that you want to add or edit for the specified health check or hosted zone.

    .LINK
        http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-route53-hostedzone-hostedzonetags.html

    .PARAMETER Key
        The value of Key depends on the operation that you want to perform:
+  **Add a tag to a health check or hosted zone**: Key is the name that you want to give the new tag.
+  **Edit a tag**: Key is the name of the tag that you want to change the Value for.
+  ** Delete a key**: Key is the name of the tag you want to remove.
+  **Give a name to a health check**: Edit the default Name tag. In the Amazon Route 53 console, the list of your health checks includes a **Name** column that lets you see the name that you've given to each health check.

        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-route53-hostedzone-hostedzonetags.html#cfn-route53-hostedzonetags-key
        PrimitiveType: String
        UpdateType: Mutable

    .PARAMETER Value
        The value of Value depends on the operation that you want to perform:
+  **Add a tag to a health check or hosted zone**: Value is the value that you want to give the new tag.
+  **Edit a tag**: Value is the new value that you want to assign the tag.

        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-route53-hostedzone-hostedzonetags.html#cfn-route53-hostedzonetags-value
        PrimitiveType: String
        UpdateType: Mutable

    .FUNCTIONALITY
        Vaporshell
    #>
    [OutputType('Vaporshell.Resource.Route53.HostedZone.HostedZoneTag')]
    [cmdletbinding()]
    Param
    (
        [parameter(Mandatory = $true)]
        [ValidateScript( {
                $allowedTypes = "System.String","Vaporshell.Function","Vaporshell.Condition"
                if ([string]$($_.PSTypeNames) -match "($(($allowedTypes|ForEach-Object{[RegEx]::Escape($_)}) -join '|'))") {
                    $true
                }
                else {
                    $PSCmdlet.ThrowTerminatingError((New-VSError -String "This parameter only accepts the following types: $($allowedTypes -join ", "). The current types of the value are: $($_.PSTypeNames -join ", ")."))
                }
            })]
        $Key,
        [parameter(Mandatory = $true)]
        [ValidateScript( {
                $allowedTypes = "System.String","Vaporshell.Function","Vaporshell.Condition"
                if ([string]$($_.PSTypeNames) -match "($(($allowedTypes|ForEach-Object{[RegEx]::Escape($_)}) -join '|'))") {
                    $true
                }
                else {
                    $PSCmdlet.ThrowTerminatingError((New-VSError -String "This parameter only accepts the following types: $($allowedTypes -join ", "). The current types of the value are: $($_.PSTypeNames -join ", ")."))
                }
            })]
        $Value
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
        $obj | Add-ObjectDetail -TypeName 'Vaporshell.Resource.Route53.HostedZone.HostedZoneTag'
        Write-Verbose "Resulting JSON from $($MyInvocation.MyCommand): `n`n$($obj | ConvertTo-Json -Depth 5)`n"
    }
}
