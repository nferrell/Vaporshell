# Add-VSGlueSecurityConfigurationS3Encryption

## SYNOPSIS
Adds an AWS::Glue::SecurityConfiguration.S3Encryption resource property to the template.
Specifies how Amazon Simple Storage Service (Amazon S3 data should be encrypted.

## SYNTAX

```
Add-VSGlueSecurityConfigurationS3Encryption [[-KmsKeyArn] <Object>] [[-S3EncryptionMode] <Object>]
 [<CommonParameters>]
```

## DESCRIPTION
Adds an AWS::Glue::SecurityConfiguration.S3Encryption resource property to the template.
Specifies how Amazon Simple Storage Service (Amazon S3 data should be encrypted.

## PARAMETERS

### -KmsKeyArn
The Amazon Resource Name ARN of the KMS key to be used to encrypt the data.

Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-glue-securityconfiguration-s3encryption.html#cfn-glue-securityconfiguration-s3encryption-kmskeyarn
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

### -S3EncryptionMode
The encryption mode to use for Amazon S3 data.

Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-glue-securityconfiguration-s3encryption.html#cfn-glue-securityconfiguration-s3encryption-s3encryptionmode
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

### Vaporshell.Resource.Glue.SecurityConfiguration.S3Encryption
## NOTES

## RELATED LINKS

[http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-glue-securityconfiguration-s3encryption.html](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-glue-securityconfiguration-s3encryption.html)

