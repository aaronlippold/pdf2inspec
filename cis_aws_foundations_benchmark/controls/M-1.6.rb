control "M-1.6" do
  title "1.6 Ensure IAM password policy require at least one lowercase letter
(Scored)"
  desc  "Password policies are, in part, used to enforce password complexity
requirements. IAM password policies can be used to ensure password are
comprised of different character sets. It is recommended that the password
policy require at least one lowercase letter. Setting a password complexity
policy increases account resiliency against brute force login attempts. "
  impact 0.5
  tag "ref": "1. CCE-78904-0"
  tag "severity": "medium"
  tag "cis_id": "1.6"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Perform the following to ensure the password policy is
configured as prescribed:
Via the AWS Console Login to AWS Console (with appropriate permissions to View
Identity Access
Management Account Settings) Go to IAM Service on the AWS Console Click on
Account Settings on the Left Pane Ensure 'Requires at least one lowercase
letter' is checked under 'Password Policy'
Via CLI
aws iam get-account-password-policy
Ensure the output of the above command includes 'RequireLowercaseCharacters':
true
"
  tag "fix": "Perform the following to set the password policy as prescribed:
Via the AWS Console Login to AWS Console (with appropriate permissions to View
Identity Access
Management Account Settings) Go to IAM Service on the AWS Console Click on
Account Settings on the Left Pane Check 'Requires at least one lowercase
letter' Click 'Apply password policy'
Via CLI
aws iam update-account-password-policy --require-lowercase-characters
Note: All commands starting with 'aws iam update-account-password-policy' can
be
combined into a single command.
"
end
