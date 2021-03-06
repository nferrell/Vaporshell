# Add-VSLambdaAliasVersionWeight

## SYNOPSIS
Adds an AWS::Lambda::Alias.VersionWeight resource property to the template.
The traffic-shifting: https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html configuration of a Lambda function alias.

## SYNTAX

```
Add-VSLambdaAliasVersionWeight [-FunctionVersion] <Object> [-FunctionWeight] <Object> [<CommonParameters>]
```

## DESCRIPTION
Adds an AWS::Lambda::Alias.VersionWeight resource property to the template.
The traffic-shifting: https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html configuration of a Lambda function alias.

## PARAMETERS

### -FunctionVersion
The qualifier of the second version.

Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-lambda-alias-versionweight.html#cfn-lambda-alias-versionweight-functionversion
PrimitiveType: String
UpdateType: Mutable

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FunctionWeight
The percentage of traffic that the alias routes to the second version.

Documentation: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-lambda-alias-versionweight.html#cfn-lambda-alias-versionweight-functionweight
PrimitiveType: Double
UpdateType: Mutable

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### Vaporshell.Resource.Lambda.Alias.VersionWeight
## NOTES

## RELATED LINKS

[http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-lambda-alias-versionweight.html](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-lambda-alias-versionweight.html)

