# Add-VSSESReceiptRuleSNSAction

## SYNOPSIS
Adds an AWS::SES::ReceiptRule.SNSAction resource property to the template.
When included in a receipt rule, this action publishes a notification to Amazon Simple Notification Service (Amazon SNS.
This action includes a complete copy of the email content in the Amazon SNS notifications.
Amazon SNS notifications for all other actions simply provide information about the email.
They don't include the email content itself.

## SYNTAX

```
Add-VSSESReceiptRuleSNSAction [[-TopicArn] <Object>] [[-Encoding] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Adds an AWS::SES::ReceiptRule.SNSAction resource property to the template.
When included in a receipt rule, this action publishes a notification to Amazon Simple Notification Service (Amazon SNS.
This action includes a complete copy of the email content in the Amazon SNS notifications.
Amazon SNS notifications for all other actions simply provide information about the email.
They don't include the email content itself.

If you own the Amazon SNS topic, you don't need to do anything to give Amazon SES permission to publish emails to it.
However, if you don't own the Amazon SNS topic, you need to attach a policy to the topic to give Amazon SES permissions to access it.
For information about giving permissions, see the Amazon SES Developer Guide: https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html.

**Important**

You can only publish emails that are 150 KB or less (including the header to Amazon SNS.
Emails that are larger than 150 KB aren't published.
If you anticipate emails larger than 150 KB, use the S3 action instead.

For information about using a receipt rule to publish an Amazon SNS notification, see the Amazon SES Developer Guide: https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-sns.html.

## PARAMETERS

### -TopicArn
The Amazon Resource Name ARN of the Amazon SNS topic to notify.
You can find the ARN of a topic by using the ListTopics: https://docs.aws.amazon.com/sns/latest/api/API_ListTopics.html operation in the Amazon SNS API.
For more information about Amazon SNS topics, see the Amazon SNS Developer Guide: https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html.

Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ses-receiptrule-snsaction.html#cfn-ses-receiptrule-snsaction-topicarn
PrimitiveType: String
UpdateType: Mutable

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Encoding
The encoding to use for the email within the Amazon SNS notification.
UTF-8 is easier to use, but may not preserve all special characters when a message was encoded with a different encoding format.
Base64 preserves all special characters.
The default value is UTF-8.

Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ses-receiptrule-snsaction.html#cfn-ses-receiptrule-snsaction-encoding
PrimitiveType: String
UpdateType: Mutable

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### Vaporshell.Resource.SES.ReceiptRule.SNSAction
## NOTES

## RELATED LINKS

[http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ses-receiptrule-snsaction.html](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ses-receiptrule-snsaction.html)

