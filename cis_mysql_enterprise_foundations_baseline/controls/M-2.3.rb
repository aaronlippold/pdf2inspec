control "M-2.3" do
  title "2.3 Do Not Reuse User Accounts (Not Scored)"
  desc  "Database user accounts should not be reused for multiple applications
or users. Utilizing unique database accounts across applications will reduce
the impact of a compromised MySQL account. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "2.3"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Each user should be linked to one of these system accounts

a person
an application
"
  tag "fix": "Add/Remove users so that each user is only used for one specific
purpose. "
end
