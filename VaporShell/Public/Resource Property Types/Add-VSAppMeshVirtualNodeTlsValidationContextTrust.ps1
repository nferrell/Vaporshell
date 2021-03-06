function Add-VSAppMeshVirtualNodeTlsValidationContextTrust {
    <#
    .SYNOPSIS
        Adds an AWS::AppMesh::VirtualNode.TlsValidationContextTrust resource property to the template. An object that represents a Transport Layer Security (TLS validation context trust.

    .DESCRIPTION
        Adds an AWS::AppMesh::VirtualNode.TlsValidationContextTrust resource property to the template.
An object that represents a Transport Layer Security (TLS validation context trust.

    .LINK
        http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-appmesh-virtualnode-tlsvalidationcontexttrust.html

    .PARAMETER ACM
        A reference to an object that represents a TLS validation context trust for an AWS Certicate Manager ACM certificate.

        Type: TlsValidationContextAcmTrust
        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-appmesh-virtualnode-tlsvalidationcontexttrust.html#cfn-appmesh-virtualnode-tlsvalidationcontexttrust-acm
        UpdateType: Mutable

    .PARAMETER File
        An object that represents a TLS validation context trust for a local file.

        Type: TlsValidationContextFileTrust
        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-appmesh-virtualnode-tlsvalidationcontexttrust.html#cfn-appmesh-virtualnode-tlsvalidationcontexttrust-file
        UpdateType: Mutable

    .FUNCTIONALITY
        Vaporshell
    #>
    [OutputType('Vaporshell.Resource.AppMesh.VirtualNode.TlsValidationContextTrust')]
    [cmdletbinding()]
    Param
    (
        [parameter(Mandatory = $false)]
        $ACM,
        [parameter(Mandatory = $false)]
        $File
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
        $obj | Add-ObjectDetail -TypeName 'Vaporshell.Resource.AppMesh.VirtualNode.TlsValidationContextTrust'
        Write-Verbose "Resulting JSON from $($MyInvocation.MyCommand): `n`n$($obj | ConvertTo-Json -Depth 5)`n"
    }
}
