control "M-1.20" do
  title "1.20 Ensure security contact information is registered (Scored)"
  desc  "AWS provides customers with the option of specifying the contact
information for account's security team. It is recommended that this
information be provided. Specifying security-specific contact information will
help ensure that security advisories sent by AWS reach the team in your
organization that is best equipped to respond to them. "
  impact 0.5
  tag "ref": "1. CCE-79200-2"
  tag "severity": "medium"
  tag "cis_id": "1.20"
  tag "cis_control": "No CIS Control"
  tag "cis_level": "Level 1"
  tag "nist": ["Not Mapped"]
  tag "audit": "Perform the following in the AWS Management Console to
determine if security contact
information is present:
Click on your account name at the top right corner of the console
From the drop-down menu Click My Account
Scroll down to the Alternate Contacts section
Ensure contact information is specified in the Security section
"
  tag "fix": "Perform the following in the AWS Management Console to establish
security contact
information:
Click on your account name at the top right corner of the console.
From the drop-down menu Click My Account
Scroll down to the Alternate Contacts section
Enter contact information in the Security section
Note: Consider specifying an internal email distribution list to ensure emails
are regularly
monitored by more than one individual.
"
end
