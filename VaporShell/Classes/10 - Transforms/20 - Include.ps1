using namespace System
using namespace System.Collections
using namespace System.Collections.Generic
using namespace System.Management.Automation

class Include : FnTransform {
    hidden [string] $_vsFunctionName = 'Add-Include'
    hidden [string] $_awsDocumentation = 'https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html'

    [string] ToString() {
        return "Include($($this.Parameters['Location']))"
    }

    hidden [void] SetLocation([object] $inputData) {
        $this['LogicalId'] = 'Fn::Transform'
        $this['Name'] = 'AWS::Include'
        if ($null -eq $this['Parameters']) {
            $this['Parameters'] = [ordered]@{Location = ''}
        }
        $props = if ($inputData -is [string]) {
            [pscustomobject]@{
                Location = $inputData
            }
        }
        elseif ($inputData -is [IDictionary]) {
            [pscustomobject]$inputData
        }
        elseif ($inputData -is [psobject]) {
            $inputData
        }
        else {
            $errorRecord = [VSError]::new(
                [ArgumentException]::new("Invalid input! Please either pass an IDictionary or PSObject containing a Parameters or Location property or just the S3 location as a string value."),
                'InvalidInput',
                [ErrorCategory]::InvalidArgument,
                $inputData
            )
            throw [VSError]::InsertError($errorRecord)
        }
        if ($props.PSObject.Properties.Name -contains 'Parameters') {
            if ($props.Parameters.Location -notmatch '^s3:\/\/.*') {
                $errorRecord = [VSError]::new(
                    [ArgumentException]::new("$($props.Parameters.Location) is not a valid s3 path! Location must match pattern '^s3:\/\/.*'"),
                    'InvalidLocation',
                    [ErrorCategory]::InvalidArgument,
                    $props
                )
                throw [VSError]::InsertError($errorRecord)
            }
            else {
                $this['Parameters']['Location'] = $props.Parameters.Location
            }
        }
        elseif ($props.PSObject.Properties.Name -contains 'Location') {
            if ($props.Location -match '^s3:\/\/.*') {
                $this['Parameters']['Location'] = $props.Location
            }
            else {
                $errorRecord = [VSError]::new(
                    [ArgumentException]::new("$($props.Location) is not a valid s3 path! Location must match pattern '^s3:\/\/.*'"),
                    'InvalidLocation',
                    [ErrorCategory]::InvalidArgument,
                    $props
                )
                throw [VSError]::InsertError($errorRecord)
            }
        }
        else {
            $errorRecord = [VSError]::new(
                [ArgumentException]::new("Invalid input! Please either pass an IDictionary or PSObject containing a Parameters or Location property or just the S3 location as a string value."),
                'InvalidInput',
                [ErrorCategory]::InvalidArgument,
                $props
            )
            throw [VSError]::InsertError($errorRecord)
        }
    }

    Include() {}

    Include([IDictionary] $props) {
        $this.SetLocation($props)
    }

    Include([psobject] $props) {
        $this.SetLocation($props)
    }

    Include([string] $location) {
        $this.SetLocation($location)
    }
}
