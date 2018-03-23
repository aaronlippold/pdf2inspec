control "M-2.1.3" do
  title "2.1.3 Secure backup credentials (Not Scored)"
  desc  "The password, certificate and any other credentials should be
protected. A user with full privileges is needed for backup. The credentials
for this user should be protected "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "2.1.3"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Check permissions of files containing passwords and/or ssl

keys.
"
  tag "fix": "Change file permissions
"
end
