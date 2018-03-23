control "M-2.4" do
  title "2.4 Do Not Reuse Usernames (Not Scored)"
  desc  "Database user accounts should not be reused for multiple applications
or users. Utilizing unique database accounts across applications will reduce
the impact of a compromised MySQL account.  "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "2.4"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Each user should be linked to one of these system accounts

a person
an application
"
  tag "fix": "Add/Remove users so that each user is only used for one specific
purpose.
"
end
