control "M-1.11" do
  title "1.11 Ensure IAM password policy expires passwords within 90 days or
less (Scored)"
  desc  "IAM password policies can require passwords to be rotated or expired
after a given number of days. It is recommended that the password policy expire
passwords after 90 days or less. Reducing the password lifetime increases
account resiliency against brute force login attempts. Additionally, requiring
regular password changes help in the following scenarios:Passwords can be
stolen or compromised sometimes without your knowledge. This can happen via a
system compromise, software vulnerability, or internal threat. Certain
corporate and government web filters or proxy servers have the ability to
intercept and record traffic even if it's encrypted. Many people use the same
password for many systems such as work, email, and personal. Compromised end
user workstations might have a keystroke logger. "
  impact 0.5
  tag "ref": "1. CCE-78909-9"
  tag "severity": "medium"
  tag "cis_id": "1.11"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Perform the following to ensure the password policy is
configured as prescribed:
Via AWS Console: Login to AWS Console (with appropriate permissions to View
Identity Access
Management Account Settings) Go to IAM Service on the AWS Console Click on
Account Settings on the Left Pane Ensure 'Enable password expiration' is
checked Ensure 'Password expiration period (in days):' is set to 90 or less
Via CLI
aws iam get-account-password-policy
Ensure the output of the above command includes 'MaxPasswordAge': 90 or less
"
  tag "fix": "Perform the following to set the password policy as prescribed:
Via AWS Console: Login to AWS Console (with appropriate permissions to View
Identity Access
Management Account Settings) Go to IAM Service on the AWS Console Click on
Account Settings on the Left Pane Check 'Enable password expiration' Set
'Password expiration period (in days):' to 90 or less
Via CLI
aws iam update-account-password-policy --max-password-age 90
Note: All commands starting with 'aws iam update-account-password-policy' can
be
combined into a single command.
"
end
