control "M-1.18" do
  title "1.18 Ensure IAM Master and IAM Manager roles are active (Scored)"
  desc  "Ensure IAM Master and IAM Manager roles are in place for IAM
administration and assignment of administrative permissions for other services
to other roles. An IAM role is conceptually “a container of permissions
resembling a user account which cannot be directly logged into, but which must
instead be assumed from an existing user account which has appropriate
permissions to do so”, in the manner of roles in Unix RoleBased Access Control
(RBAC). In AWS, roles can also be assigned to EC2 instances and Lambda
functions. Control over IAM, which is also defined and mediated by a number of
fine-grained permissions, should be divided between a number of roles, such
that no individual user in a production account has full control over IAM. IAM
is the principal point of control for service configuration access, and
'control over IAM” means “control over the configuration of all other assets in
the AWS account”. Therefore it is recommended that control of this degree of
security criticality should be divided among multiple individuals within an
organisation, in a manner such that no individual retains enough control over
IAM to “rewrite themselves to root”. Roles are recommended for
security-sensitive capabilities, as the act of assuming a role generates a set
of ephemeral credentials using the Security Token Service (STS) and these
credentials - being a token, an AWS Access Key and an AWS Secret Access Key -
are needed to make API calls in the context of the role. STS credentials expire
after a configurable period (default 12 hours, minimum 15 minutes, maximum 36
hours), and this reduces the risk of engineers hard-wiring these keys into
code, and therefore further reduces the risk of the keys being mishandled. The
current recommendation is to divide account and permission configuration
permissions between 2 roles, which are: IAM Master: creates users, groups and
roles; assigns permissions to roles IAM Manager: assigns users and roles to
groups In this model, IAM Master and IAM Manager must work together in a
2-person rule manner, in order for a user to gain access to a permission. "
  impact 0.5
  tag "ref": "1. https://docs.aws.amazon.com/IAM/latest/UserGuide/list_iam.html
2.
https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_configure
-api-require.html"
  tag "severity": "medium"
  tag "cis_id": "1.18"
  tag "cis_control": "No CIS Control"
  tag "cis_level": "Level 1"
  tag "nist": ["Not Mapped"]
  tag "audit": "Using the Amazon unified CLI, from a user or role which has the
iam:ListRoles and
iam:GetRolePolicy permissions:
List the configured roles:
aws iam list-roles --query 'Roles[*].{RoleName:RoleName, Arn:Arn}'
The output should contain entries with “RoleName”: “<iam_manager_role_name>”
and
“Rolename”: “<iam_master_role_name>”
Examine the permissions associated with each of these roles:
aws iam get-role-policy —role-name <iam_manager_role_name>
aws iam get-role-policy —role-name <iam_master_role_name>
The <iam_master_role_name> role should include the following Actions with an
Allow
effect:
iam: AttachRolePolicy
iam:CreateGroup
iam:CreatePolicy
iam:CreatePolicyVersion
iam:CreateRole
iam:CreateUser
iam:DeleteGroup
iam:DeletePolicy
iam:DeletePolicyVersion
iam:DeleteRole
iam:DeleteRolePolicy
iam:DeleteUser
iam:PutRolePolicy
iam:GetPolicy
iam:GetPolicyVersion
iam:GetRole
iam:GetRolePolicy
iam:GetUser
iam:GetUserPolicy
iam:ListEntitiesForPolicy
iam:ListGroupPolicies
iam:ListGroups
iam:ListGroupsForUser
iam:ListPolicies
iam:ListPoliciesGrantingServiceAccess
iam:ListPolicyVersions
iam:ListRolePolicies
iam:ListAttachedGroupPolicies
iam:ListAttachedRolePolicies
iam:ListAttachedUserPolicies
iam:ListRoles
iam:ListUsers
…and the following Actions with a Deny effect:
iam:AddUserToGroup
iam:AttachGroupPolicy
iam:DeleteGroupPolicy
iam:DeleteUserPolicy
iam:DetachGroupPolicy
iam:DetachRolePolicy
iam:DetachUserPolicy
iam:PutGroupPolicy
iam:PutUserPolicy
iam:RemoveUserFromGroup
iam:UpdateGroup
iam:UpdateAssumeRolePolicy
iam:UpdateUser
The <iam_manager_role_name> role should include the following Actions with an
Allow
effect:
iam:AddUserToGroup
iam:AttachGroupPolicy
iam:DeleteGroupPolicy
iam:DeleteUserPolicy
iam:DetachGroupPolicy
iam:DetachRolePolicy
iam:DetachUserPolicy
iam:PutGroupPolicy
iam:PutUserPolicy
iam:RemoveUserFromGroup
iam:UpdateGroup
iam:UpdateAssumeRolePolicy
iam:UpdateUser
iam:GetPolicy
iam:GetPolicyVersion
iam:GetRole
iam:GetRolePolicy
iam:GetUser
iam:GetUserPolicy
iam:ListEntitiesForPolicy
iam:ListGroupPolicies
iam:ListGroups
iam:ListGroupsForUser
iam:ListPolicies
iam:ListPoliciesGrantingServiceAccess
iam:ListPolicyVersions
iam:ListRolePolicies
iam:ListAttachedGroupPolicies
iam:ListAttachedRolePolicies
iam:ListAttachedUserPolicies
iam:ListRoles
iam:ListUsers
…and the following Actions with a Deny effect:
iam: AttachRolePolicy
iam:CreateGroup
iam:CreatePolicy
iam:CreatePolicyVersion
iam:CreateRole
iam:CreateUser
iam:DeleteGroup
iam:DeletePolicy
iam:DeletePolicyVersion
iam:DeleteRole
iam:DeleteRolePolicy
iam:DeleteUser
iam:PutRolePolicy
Other iam:* Actions may be included in these policies as needed.
Both policies should also be limited by a Condition that MFA authentication is
in effect, by
containing:
'Condition': {'Bool': {'aws:MultiFactorAuthPresent': 'true'}}
in the Allow effect section (provided IAM Federation has not been configured).

Each role needs to be assumable by at least one user or group:
aws iam get-role —role-name <iam_manager_role_name>
aws iam get-role —role-name <iam_master_role_name>
should display the AssumeRolePolicyDocument indicating which users and groups
are able
to assume the roles. No user or group should be able to assume both roles.
"
  tag "fix": "Using the Amazon unified CLI, from a user or role which has the
iam:CreateRole,
iam:CreatePolicy and iam:PutRolePolicy permissions:
aws iam create-role --role-name <iam_manager_role_name>
aws iam create-role --role-name <iam_master_role_name>
aws iam put-role-policy --role-name <iam_manager_role_name> --policy-name
<iam_manager_permissions_policy> --policy-document
file://IAM-Manager-policy.json
aws iam put-role-policy --role-name <iam_master_role_name> --policy-name
<iam_master_permissions_policy> --policy-document file://IAM-Master-policy.json

where IAM-Master-policy.json contains:
{
'Version': '2012-10-17',
'Statement': [{
'Action': [
“iam:CreateGroup”,
“iam:CreatePolicy”,
“iam:CreatePolicyVersion”,
“iam:CreateRole”,
“iam:CreateUser”,
“iam:DeleteGroup”,
“iam:DeletePolicy”,
“iam:DeletePolicyVersion”,
“iam:DeleteRole”,
“iam:DeleteRolePolicy”,
“iam:DeleteUser”,
“iam:PutRolePolicy”,
'iam:GetPolicy”,
'iam:GetPolicyVersion”,
'iam:GetRole”,
'iam:GetRolePolicy”,
'iam:GetUser”,
'iam:GetUserPolicy”,
'iam:ListEntitiesForPolicy”,
'iam:ListGroupPolicies”,
'iam:ListGroups”,
'iam:ListGroupsForUser”,
'iam:ListPolicies”,
'iam:ListPoliciesGrantingServiceAccess”,
'iam:ListPolicyVersions”,
'iam:ListRolePolicies”,
'iam:ListAttachedGroupPolicies”,
'iam:ListAttachedRolePolicies”,
'iam:ListAttachedUserPolicies”,
'iam:ListRoles”,
'iam:ListUsers”
],
'Effect': 'Allow',
'Resource': “*”,
'Condition': {'Bool': {'aws:MultiFactorAuthPresent': 'true'}}
}],
'Action': [
“iam:AddUserToGroup”,
“iam:AttachGroupPolicy”,
“iam:DeleteGroupPolicy”,
“iam:DeleteUserPolicy”,
“iam:DetachGroupPolicy”,
“iam:DetachRolePolicy”,
“iam:DetachUserPolicy”,
“iam:PutGroupPolicy”,
“iam:PutUserPolicy”,
“iam:RemoveUserFromGroup”,
“iam:UpdateGroup”,
“iam:UpdateAssumeRolePolicy”,
“iam:UpdateUser'
],
'Effect': “Deny',
'Resource': “*'
}]
}
and where IAM-Manager-policy.json contains:
{
'Version': '2012-10-17',
'Statement': [{
'Action': [
“iam:AddUserToGroup”,
“iam:AttachGroupPolicy”,
“iam:DeleteGroupPolicy”,
“iam:DeleteUserPolicy”,
“iam:DetachGroupPolicy”,
“iam:DetachRolePolicy”,
“iam:DetachUserPolicy”,
“iam:PutGroupPolicy”,
“iam:PutUserPolicy”,
“iam:RemoveUserFromGroup”,
“iam:UpdateGroup”,
“iam:UpdateAssumeRolePolicy”,
“iam:UpdateUser”,
'iam:GetPolicy”,
'iam:GetPolicyVersion”,
'iam:GetRole”,
'iam:GetRolePolicy”,
'iam:GetUser”,
'iam:GetUserPolicy”,
'iam:ListEntitiesForPolicy”,
'iam:ListGroupPolicies”,
'iam:ListGroups”,
'iam:ListGroupsForUser”,
'iam:ListPolicies”,
'iam:ListPoliciesGrantingServiceAccess”,
'iam:ListPolicyVersions”,
'iam:ListRolePolicies”,
'iam:ListAttachedGroupPolicies”,
'iam:ListAttachedRolePolicies”,
'iam:ListAttachedUserPolicies”,
'iam:ListRoles”,
'iam:ListUsers”
],
'Effect': 'Allow',
'Resource': “*”,
'Condition': {'Bool': {'aws:MultiFactorAuthPresent': 'true'}}
}],
'Action': [
“iam:CreateGroup”,
“iam:CreatePolicy”,
“iam:CreatePolicyVersion”,
“iam:CreateRole”,
“iam:CreateUser”,
“iam:DeleteGroup”,
“iam:DeletePolicy”,
“iam:DeletePolicyVersion”,
“iam:DeleteRole”,
“iam:DeleteRolePolicy”,
“iam:DeleteUser”,
“iam:PutRolePolicy”
],
'Effect': “Deny',
'Resource': “*'
}]
}
Note that each of IAM-Manager-policy.json and IAM-Master-policy.json can
contain other
iam:* permissions in either Allow or Deny Action lists, depending on what other
requirements
are in place in the account.
Each of these roles needs to be assumable by a different user or group.
For appropriate users or groups (groups are recommended):
aws iam put-user-policy --user-name <iam_user> --policy-name
<assume_iam_master_role_policy> --policy-document file://Assume-IAM-Master.json

aws iam put-user-policy --user-name <iam_user> --policy-name
<assume_iam_manager_role_policy> --policy-document
file://Assume-IAM-Manager.json
or
aws iam put-group-policy --group-name <iam_group> --policy-name
<assume_iam_master_role_policy> --policy-document file://Assume-IAM-Master.json

aws iam put-group-policy --group-name <iam_group> --policy-name
<assume_iam_manager_role_policy> --policy-document
file://Assume-IAM-Manager.json
where Assume-IAM-Master.json is:
{
'Version': '2012-10-17',
'Statement': {
'Effect': 'Allow',
'Action': 'sts:AssumeRole',
'Resource': 'arn:aws:iam::<aws_account_number>:role/<iam_master_role_name>'
}
}
and Assume-IAM-Manager.json is:
{
'Version': '2012-10-17',
'Statement': {
'Effect': 'Allow',
'Action': 'sts:AssumeRole',
'Resource': 'arn:aws:iam::<aws_account_number>:role/<iam_manager_role_name>'
}
}
"
end
