﻿function Add-VSGreengrassResourceDefinitionVersionLocalVolumeResourceData {
    <#
    .SYNOPSIS
        Adds an AWS::Greengrass::ResourceDefinitionVersion.LocalVolumeResourceData resource property to the template

    .DESCRIPTION
        Adds an AWS::Greengrass::ResourceDefinitionVersion.LocalVolumeResourceData resource property to the template

    .LINK
        http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-greengrass-resourcedefinitionversion-localvolumeresourcedata.html

    .PARAMETER SourcePath
		Required: True    
		Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-greengrass-resourcedefinitionversion-localvolumeresourcedata.html#cfn-greengrass-resourcedefinitionversion-localvolumeresourcedata-sourcepath    
		PrimitiveType: String    
		UpdateType: Immutable    

    .PARAMETER DestinationPath
		Required: True    
		Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-greengrass-resourcedefinitionversion-localvolumeresourcedata.html#cfn-greengrass-resourcedefinitionversion-localvolumeresourcedata-destinationpath    
		PrimitiveType: String    
		UpdateType: Immutable    

    .PARAMETER GroupOwnerSetting
		Type: GroupOwnerSetting    
		Required: False    
		Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-greengrass-resourcedefinitionversion-localvolumeresourcedata.html#cfn-greengrass-resourcedefinitionversion-localvolumeresourcedata-groupownersetting    
		UpdateType: Immutable    

    .FUNCTIONALITY
        Vaporshell
    #>
    [OutputType('Vaporshell.Resource.Greengrass.ResourceDefinitionVersion.LocalVolumeResourceData')]
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
        $SourcePath,
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
        $DestinationPath,
        [parameter(Mandatory = $false)]
        $GroupOwnerSetting
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
        $obj | Add-ObjectDetail -TypeName 'Vaporshell.Resource.Greengrass.ResourceDefinitionVersion.LocalVolumeResourceData'
        Write-Verbose "Resulting JSON from $($MyInvocation.MyCommand): `n`n$($obj | ConvertTo-Json -Depth 5)`n"
    }
}