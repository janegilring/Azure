Install-Module -Name az

Connect-AzAccount

Set-AzContext -Subscription 'Tine Core'

#region Example from Azure policy documentation
# https://docs.microsoft.com/en-us/azure/governance/policy/samples/enforce-tag-match-pattern

    $definition = New-AzPolicyDefinition -Name "enforce-like-pattern" -DisplayName "Ensure resource names meet the like condition for a pattern." -description "Ensure resource names meet the like condition for a pattern." -Policy 'https://raw.githubusercontent.com/Azure/azure-policy/master/samples/TextPatterns/enforce-like-pattern/azurepolicy.rules.json' -Parameter 'https://raw.githubusercontent.com/Azure/azure-policy/master/samples/TextPatterns/enforce-like-pattern/azurepolicy.parameters.json' -Mode All
    $definition
    $assignment = New-AzPolicyAssignment -Name <assignmentname> -Scope <scope> -PolicyDefinition $definition
    $assignment

#endregion

#region Enforce tag match pattern

    $definition = New-AzPolicyDefinition -Name "enforce-tag-match-pattern" -DisplayName "Ensure that a tag value matches a text pattern." -description "Ensure that a tag value matches a text pattern." -Policy 'https://raw.githubusercontent.com/Azure/azure-policy/master/samples/TextPatterns/enforce-tag-match-pattern/azurepolicy.rules.json' -Parameter 'https://raw.githubusercontent.com/Azure/azure-policy/master/samples/TextPatterns/enforce-tag-match-pattern/azurepolicy.parameters.json' -Mode All

    $policy = '.\enforce-tag-match-pattern-parameterized\azurepolicy.rules.json'
    $parameters = '.\enforce-tag-match-pattern-parameterized\azurepolicy.parameters.json'
    New-AzPolicyDefinition -ManagementGroupName IT -Name "enforce-tag-match-pattern" -DisplayName "Ensure that a tag value matches a text pattern." -description "Ensure that a tag value matches a text pattern." -Policy $policy  -Parameter $parameters -Mode Indexed

    Get-AzPolicyDefinition -Name "enforce-tag-match-pattern" -ManagementGroupName IT

#endregion

#region Enforce tag contains pre-defined value

    $policy = '.\enforce-tag-contains-specified-values-parameterized\azurepolicy.rules.json'
    $parameters = '.\enforce-tag-contains-specified-values-parameterized\azurepolicy.parameters.json'
    New-AzPolicyDefinition -ManagementGroupName IT -Name "enforce-tag-contains-predefined-value" -DisplayName "Ensure that a tag value contains a pre-defined value" -description "Ensure that a tag value contains a pre-defined value" -Policy $policy  -Parameter $parameters -Mode Indexed

    Get-AzPolicyDefinition -Name "enforce-tag-contains-predefined-value" -ManagementGroupName IT

#endregion

#region Enforce tag exists

    $policy = '.\enforce-tag-exists\azurepolicy.rules.json'
    $parameters = '.\enforce-tag-exists\azurepolicy.parameters.json'
    New-AzPolicyDefinition -ManagementGroupName IT -Name "enforce-tag-exists" -DisplayName "Ensure that a tag exists" -description "Ensure that a tag exists" -Policy $policy  -Parameter $parameters -Mode Indexed

    Get-AzPolicyDefinition -Name "enforce-tag-exists" -ManagementGroupName IT

#endregion



#region Enforce resource group like pattern

    $policy = '.\enforce-resourceGroup-like-pattern\azurepolicy.rules.json'
    $parameters = '.\enforce-resourceGroup-like-pattern\azurepolicy.parameters.json'
    New-AzPolicyDefinition -ManagementGroupName IT -Name "enforce-resourceGroup-like-pattern" -DisplayName "Resource group name pattern with like condition" -description "Enforce a naming pattern on resource groups with the like condition." -Policy $policy  -Parameter $parameters -Mode All

    Get-AzPolicyDefinition -Name "enforce-resourceGroup-like-pattern" -ManagementGroupName IT

#endregion