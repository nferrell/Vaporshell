function Add-VSMediaLiveChannelAudioSelectorSettings {
    <#
    .SYNOPSIS
        Adds an AWS::MediaLive::Channel.AudioSelectorSettings resource property to the template. Information about the audio to extract from the input.

    .DESCRIPTION
        Adds an AWS::MediaLive::Channel.AudioSelectorSettings resource property to the template.
Information about the audio to extract from the input.

The parent of this entity is AudioSelector.

    .LINK
        http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-medialive-channel-audioselectorsettings.html

    .PARAMETER AudioPidSelection
        The PID of the audio to select.

        Type: AudioPidSelection
        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-medialive-channel-audioselectorsettings.html#cfn-medialive-channel-audioselectorsettings-audiopidselection
        UpdateType: Mutable

    .PARAMETER AudioLanguageSelection
        The language code of the audio to select.

        Type: AudioLanguageSelection
        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-medialive-channel-audioselectorsettings.html#cfn-medialive-channel-audioselectorsettings-audiolanguageselection
        UpdateType: Mutable

    .FUNCTIONALITY
        Vaporshell
    #>
    [OutputType('Vaporshell.Resource.MediaLive.Channel.AudioSelectorSettings')]
    [cmdletbinding()]
    Param
    (
        [parameter(Mandatory = $false)]
        $AudioPidSelection,
        [parameter(Mandatory = $false)]
        $AudioLanguageSelection
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
        $obj | Add-ObjectDetail -TypeName 'Vaporshell.Resource.MediaLive.Channel.AudioSelectorSettings'
        Write-Verbose "Resulting JSON from $($MyInvocation.MyCommand): `n`n$($obj | ConvertTo-Json -Depth 5)`n"
    }
}
