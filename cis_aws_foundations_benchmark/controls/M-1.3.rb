control "M-1.3" do
  title "1.3 Ensure credentials unused for 90 days or greater are disabled
(Scored)"
  desc  "AWS IAM users can access AWS resources using different types of
credentials, such as passwords or access keys. It is recommended that all
credentials that have been unused in 90 or greater days be removed or
deactivated. Disabling or removing unnecessary credentials will reduce the
window of opportunity for credentials associated with a compromised or
abandoned account to be used. "
  impact 0.5
  tag "ref": "1. CCE-78900-8 2. CIS CSC v6.0 #16.6"
  tag "severity": "medium"
  tag "cis_id": "1.3"
  tag "cis_control": "16.6"
  tag "cis_level": "Level 1"
  tag "nist": ["IA-4"]
  tag "audit": "Perform the following to determine if unused credentials exist:

Login to the AWS Management Console
Click Services
Click IAM
Click on Credential Report
This will download an .xls file which contains credential usage for all users
within
an AWS Account - open this file For each user having password_enabled set to
TRUE, ensure password_last_used is
less than 90 days ago. For each user having access_key_1_active or
access_key_2_active to TRUE,
ensure the corresponding access_key_n_last_used_date is less than 90 days ago.

Via CLI Run the following commands:
aws iam generate-credential-report
aws iam get-credential-report --query 'Content' --output text | base64 -d | cut

-d, -f1,9,10,11,14,15,16 For each user having password_enabled set to TRUE,
ensure password_last_used_date is less than 90 days ago. For each user having
an access_key_1_active or access_key_2_active to TRUE,
ensure the corresponding access_key_n_last_used_date is less than 90 days ago.

"
  tag "fix": "Perform the following to remove or deactivate credentials:
Login to the AWS Management Console:
Click Services
Click IAM
Click on Users
Click on Security Credentials
As an Administrator
o Click on Make Inactive for credentials that have not been used in 90 Days As
an IAM User
o Click on Make Inactive or Delete for credentials which have not been used
in 90 Days
"
end
