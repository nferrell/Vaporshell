function Add-VSAccessAnalyzerAnalyzerFilter {
    <#
    .SYNOPSIS
        Adds an AWS::AccessAnalyzer::Analyzer.Filter resource property to the template. The criteria that defines the rule.

    .DESCRIPTION
        Adds an AWS::AccessAnalyzer::Analyzer.Filter resource property to the template.
The criteria that defines the rule.

    .LINK
        http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-accessanalyzer-analyzer-filter.html

    .PARAMETER Contains
        A "contains" condition to match for the rule.

        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-accessanalyzer-analyzer-filter.html#cfn-accessanalyzer-analyzer-filter-contains
        UpdateType: Mutable
        Type: List
        PrimitiveItemType: String

    .PARAMETER Eq
        An "equals" condition to match for the rule.

        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-accessanalyzer-analyzer-filter.html#cfn-accessanalyzer-analyzer-filter-eq
        UpdateType: Mutable
        Type: List
        PrimitiveItemType: String

    .PARAMETER Exists
        An "exists" condition to match for the rule.

        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-accessanalyzer-analyzer-filter.html#cfn-accessanalyzer-analyzer-filter-exists
        UpdateType: Mutable
        PrimitiveType: Boolean

    .PARAMETER Property
        The property used to define the criteria in the filter for the rule.

        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-accessanalyzer-analyzer-filter.html#cfn-accessanalyzer-analyzer-filter-property
        UpdateType: Mutable
        PrimitiveType: String

    .PARAMETER Neq
        A "not equal" condition to match for the rule.

        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-accessanalyzer-analyzer-filter.html#cfn-accessanalyzer-analyzer-filter-neq
        UpdateType: Mutable
        Type: List
        PrimitiveItemType: String

    .FUNCTIONALITY
        Vaporshell
    #>
    [OutputType('Vaporshell.Resource.AccessAnalyzer.Analyzer.Filter')]
    [cmdletbinding()]
    Param
    (
        [parameter(Mandatory = $false)]
        $Contains,
        [parameter(Mandatory = $false)]
        $Eq,
        [parameter(Mandatory = $false)]
        [ValidateScript( {
                $allowedTypes = "System.Boolean","Vaporshell.Function","Vaporshell.Condition"
                if ([string]$($_.PSTypeNames) -match "($(($allowedTypes|ForEach-Object{[RegEx]::Escape($_)}) -join '|'))") {
                    $true
                }
                else {
                    $PSCmdlet.ThrowTerminatingError((New-VSError -String "This parameter only accepts the following types: $($allowedTypes -join ", "). The current types of the value are: $($_.PSTypeNames -join ", ")."))
                }
            })]
        $Exists,
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
        $Property,
        [parameter(Mandatory = $false)]
        $Neq
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
        $obj | Add-ObjectDetail -TypeName 'Vaporshell.Resource.AccessAnalyzer.Analyzer.Filter'
        Write-Verbose "Resulting JSON from $($MyInvocation.MyCommand): `n`n$($obj | ConvertTo-Json -Depth 5)`n"
    }
}
