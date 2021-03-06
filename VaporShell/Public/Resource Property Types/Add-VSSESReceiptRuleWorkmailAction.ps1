function Add-VSSESReceiptRuleWorkmailAction {
    <#
    .SYNOPSIS
        Adds an AWS::SES::ReceiptRule.WorkmailAction resource property to the template. When included in a receipt rule, this action calls Amazon WorkMail and, optionally, publishes a notification to Amazon Simple Notification Service (Amazon SNS. It usually isn't necessary to use this action directly, because Amazon WorkMail adds the rule automatically during its setup procedure.

    .DESCRIPTION
        Adds an AWS::SES::ReceiptRule.WorkmailAction resource property to the template.
When included in a receipt rule, this action calls Amazon WorkMail and, optionally, publishes a notification to Amazon Simple Notification Service (Amazon SNS. It usually isn't necessary to use this action directly, because Amazon WorkMail adds the rule automatically during its setup procedure.

For information using a receipt rule to call Amazon WorkMail, see the Amazon SES Developer Guide: https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-workmail.html.

    .LINK
        http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ses-receiptrule-workmailaction.html

    .PARAMETER TopicArn
        The Amazon Resource Name ARN of the Amazon SNS topic to notify when the WorkMail action is called. You can find the ARN of a topic by using the ListTopics: https://docs.aws.amazon.com/sns/latest/api/API_ListTopics.html operation in the Amazon SNS API.
For more information about Amazon SNS topics, see the Amazon SNS Developer Guide: https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html.

        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ses-receiptrule-workmailaction.html#cfn-ses-receiptrule-workmailaction-topicarn
        PrimitiveType: String
        UpdateType: Mutable

    .PARAMETER OrganizationArn
        The Amazon Resource Name ARN of the Amazon WorkMail organization. Amazon WorkMail ARNs use the following format:
arn:aws:workmail:<region>:<awsAccountId>:organization/<workmailOrganizationId>
You can find the ID of your organization by using the ListOrganizations: https://docs.aws.amazon.com/workmail/latest/APIReference/API_ListOrganizations.html operation in the Amazon WorkMail API. Amazon WorkMail organization IDs begin with "m-", followed by a string of alphanumeric characters.
For information about Amazon WorkMail organizations, see the Amazon WorkMail Administrator Guide: https://docs.aws.amazon.com/workmail/latest/adminguide/organizations_overview.html.

        Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ses-receiptrule-workmailaction.html#cfn-ses-receiptrule-workmailaction-organizationarn
        PrimitiveType: String
        UpdateType: Mutable

    .FUNCTIONALITY
        Vaporshell
    #>
    [OutputType('Vaporshell.Resource.SES.ReceiptRule.WorkmailAction')]
    [cmdletbinding()]
    Param
    (
        [parameter(Mandatory = $false)]
        [ValidateScript( {
                $allowedTypes = "System.String","Vaporshell.Function","Vaporshell.Condition"
                if ([string]$($_.PSTypeNames) -match "($(($allowedTypes|ForEach-Object{[RegEx]::Escape($_)}) -join '|'))") {
                    $true
                }
                else {
                    $PSCmdlet.ThrowTerminatingError((New-VSError -String "This parameter only accepts the following types: $($allowedTypes -join ", "). The current types of the value are: $($_.PSTypeNames -join ", ")."))
                }
            })]
        $TopicArn,
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
        $OrganizationArn
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
        $obj | Add-ObjectDetail -TypeName 'Vaporshell.Resource.SES.ReceiptRule.WorkmailAction'
        Write-Verbose "Resulting JSON from $($MyInvocation.MyCommand): `n`n$($obj | ConvertTo-Json -Depth 5)`n"
    }
}
