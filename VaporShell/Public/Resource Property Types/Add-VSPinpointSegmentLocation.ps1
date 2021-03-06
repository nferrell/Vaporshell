function Add-VSPinpointSegmentLocation {
    <#
    .SYNOPSIS
        Adds an AWS::Pinpoint::Segment.Location resource property to the template. Specifies location-based criteria, such as country or region, for a segment.

    .DESCRIPTION
        Adds an AWS::Pinpoint::Segment.Location resource property to the template.
Specifies location-based criteria, such as country or region, for a segment.

    .LINK
        http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-pinpoint-segment-segmentdimensions-location.html

    .PARAMETER GPSPoint
        The GPS location and range for the segment.

        Type: GPSPoint
        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-pinpoint-segment-segmentdimensions-location.html#cfn-pinpoint-segment-segmentdimensions-location-gpspoint
        UpdateType: Mutable

    .PARAMETER Country
        The country or region code, in ISO 3166-1 alpha-2 format, for the segment.

        Type: SetDimension
        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-pinpoint-segment-segmentdimensions-location.html#cfn-pinpoint-segment-segmentdimensions-location-country
        UpdateType: Mutable

    .FUNCTIONALITY
        Vaporshell
    #>
    [OutputType('Vaporshell.Resource.Pinpoint.Segment.Location')]
    [cmdletbinding()]
    Param
    (
        [parameter(Mandatory = $false)]
        $GPSPoint,
        [parameter(Mandatory = $false)]
        $Country
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
        $obj | Add-ObjectDetail -TypeName 'Vaporshell.Resource.Pinpoint.Segment.Location'
        Write-Verbose "Resulting JSON from $($MyInvocation.MyCommand): `n`n$($obj | ConvertTo-Json -Depth 5)`n"
    }
}
