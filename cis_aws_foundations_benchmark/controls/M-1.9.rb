control "M-1.9" do
  title "1.9 Ensure IAM password policy requires minimum length of 14 or
greater (Scored)"
  desc  "Password policies are, in part, used to enforce password complexity
requirements. IAM password policies can be used to ensure password are at least
a given length. It is recommended that the password policy require a minimum
password length 14. Setting a password complexity policy increases account
resiliency against brute force login attempts. "
  impact 0.5
  tag "ref": "1. CCE-78907-3 2. CIS CSC v6.0 #5.7, #16.12"
  tag "severity": "medium"
  tag "cis_id": "1.9"
  tag "cis_control": [["5.7", "16.12"], "6.1"]
  tag "cis_level": 1
  tag "nist": [["IA-5 (1)", 4], ["IA-2", 4]]
  tag "audit text": "Perform the following to ensure the password policy is
configured as prescribed:
Via AWS Console Login to AWS Console (with appropriate permissions to View
Identity Access
Management Account Settings) Go to IAM Service on the AWS Console Click on
Account Settings on the Left Pane Ensure 'Minimum password length' is set to 14
or greater.
Via CLI
aws iam get-account-password-policy
Ensure the output of the above command includes 'MinimumPasswordLength': 14 (or

higher)
"
  tag "fix": "Perform the following to set the password policy as prescribed:
Via AWS Console Login to AWS Console (with appropriate permissions to View
Identity Access
Management Account Settings) Go to IAM Service on the AWS Console Click on
Account Settings on the Left Pane Set 'Minimum password length' to 14 or
greater. Click 'Apply password policy'
Via CLI
aws iam update-account-password-policy --minimum-password-length 14
Note: All commands starting with 'aws iam update-account-password-policy' can
be
combined into a single command.
"
end
