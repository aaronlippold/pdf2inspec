control "M-1.12" do
  title "1.12 Ensure no root account access key exists (Scored)"
  desc  "The root account is the most privileged user in an AWS account. AWS
Access Keys provide programmatic access to a given AWS account. It is
recommended that all access keys associated with the root account be removed.
Removing access keys associated with the root account limits vectors by which
the account can be compromised. Additionally, removing the root access keys
encourages the creation and use of role based accounts that are least
privileged. "
  impact 0.5
  tag "ref": "1.
http://docs.aws.amazon.com/general/latest/gr/aws-access-keys-bestpractices.html
2. http://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html
3. http://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountSummary.
html 4. CCE-78910-7 5. CIS CSC v6.0 #5.1"
  tag "severity": "medium"
  tag "cis_id": "1.12"
  tag "cis_control": "5.1"
  tag "cis_level": "Level 1"
  tag "nist": ["AC-6 (9)"]
  tag "audit": "Perform the following to determine if the root account has
access keys:
Via the AWS Console
Login to the AWS Management Console
Click Services
Click IAM
Click on Credential Report
This will download an .xls file which contains credential usage for all IAM
users
within an AWS Account - open this file For the <root_account> user, ensure the
access_key_1_active and
access_key_2_active fields are set to FALSE.
Via CLI Run the following commands:
aws iam generate-credential-report
aws iam get-credential-report --query 'Content' --output text | base64 -d | cut

-d, -f1,9,14 | grep -B1 '<root_account>' For the <root_account> user, ensure
the access_key_1_active and access_key_2_active fields are set to FALSE.
"
  tag "fix": "Perform the following to delete or disable active root access
keys being
Via the AWS Console Sign in to the AWS Management Console as Root and open the
IAM console at
https://console.aws.amazon.com/iam/. Click on <Root_Account_Name> at the top
right and select Security Credentials
from the drop down list On the pop out screen Click on Continue to Security
Credentials Click on Access Keys (Access Key ID and Secret Access Key) Under
the Status column if there are any Keys which are Active Click on Make Inactive
- (Temporarily disable Key - may be needed again) Click Delete - (Deleted keys
cannot be recovered)
"
end
