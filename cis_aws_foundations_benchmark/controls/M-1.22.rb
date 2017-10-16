control "M-1.22" do
  title "1.22 Ensure a support role has been created to manage incidents with
AWS Support (Scored)"
  desc  "AWS provides a support center that can be used for incident
notification and response, as well as technical support and customer services.
Create an IAM Role to allow authorized users to manage incidents with AWS
Support. By implementing least privilege for access control, an IAM Role will
require an appropriate IAM Policy to allow Support Center Access in order to
manage Incidents with AWS Support. "
  impact 0.5
  tag "ref": "1.
http://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vsinline.html
2. https://aws.amazon.com/premiumsupport/pricing/ 3.
http://docs.aws.amazon.com/cli/latest/reference/iam/list-policies.html 4.
http://docs.aws.amazon.com/cli/latest/reference/iam/attach-role-policy.html 5.
http://docs.aws.amazon.com/cli/latest/reference/iam/list-entities-for-policy.html"
  tag "severity": "medium"
  tag "cis_id": "1.22"
  tag "cis_control": "No CIS Control"
  tag "cis_level": "Level 1"
  tag "nist": ["Not Mapped"]
  tag "audit": "Using the Amazon unified command line interface:List IAM
policies, filter for the 'AWSSupportAccess' managed policy, and note the
'Arn' element value:aws iam list-policies --query 'Policies[?PolicyName ==
'AWSSupportAccess']'Check if the 'AWSSupportAccess' is attached to any IAM
user, group or role:
aws iam list-entities-for-policy --policy-arn <iam_policy_arn>
"
  tag "fix": "Using the Amazon unified command line interface:Create an IAM
role for managing incidents with AWS:
o Create a trust relationship policy document that allows <iam_user> to
manage AWS incidents, and save it locally as /tmp/TrustPolicy.json:
o
{
'Version': '2012-10-17',
'Statement': [
{
'Effect': 'Allow',
'Principal': {
'AWS': '<iam_user>'
},
'Action': 'sts:AssumeRole'
}
]
}o
o
Create the IAM role using the above trust policy:o
o
Attach 'AWSSupportAccess' managed policy to the created IAM role:
aws iam create-role --role-name <aws_support_iam_role>
--assume-rolepolicy-document file:///tmp/TrustPolicy.json
aws iam attach-role-policy --policy-arn <iam_policy_arn> --role-name
<aws_support_iam_role>
"
end
