control "M-1.10" do
  title "1.10 Ensure IAM password policy prevents password reuse (Scored)"
  desc  "IAM password policies can prevent the reuse of a given password by the
same user. It is recommended that the password policy prevent the reuse of
passwords. Preventing password reuse increases account resiliency against brute
force login attempts. "
  impact 0.5
  tag "ref": "1. CCE-78908-1"
  tag "severity": "medium"
  tag "cis_id": "1.10"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Perform the following to ensure the password policy is
configured as prescribed:
Via AWS Console Login to AWS Console (with appropriate permissions to View
Identity Access
Management Account Settings) Go to IAM Service on the AWS Console Click on
Account Settings on the Left Pane Ensure 'Prevent password reuse' is checked
Ensure 'Number of passwords to remember' is set to 24
Via CLI
aws iam get-account-password-policy
Ensure the output of the above command includes 'PasswordReusePrevention': 24
"
  tag "fix": "Perform the following to set the password policy as prescribed:
Via AWS Console Login to AWS Console (with appropriate permissions to View
Identity Access
Management Account Settings) Go to IAM Service on the AWS Console Click on
Account Settings on the Left Pane Check 'Prevent password reuse' Set 'Number of
passwords to remember' is set to 24
Via CLI
aws iam update-account-password-policy --password-reuse-prevention 24
Note: All commands starting with 'aws iam update-account-password-policy' can
be
combined into a single command.
"
end
