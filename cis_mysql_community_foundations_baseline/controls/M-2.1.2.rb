control "M-2.1.2" do
  title "2.1.2 Verify backups are good (Not Scored)"
  desc  "Backups should be validated on a regular basis. Verifying that backups
are occurring appropriately will help ensure the availability of data in the
event of an incident. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "2.1.2"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Check reports of backup validation tests.
"
  tag "fix": "Implement regular backup checks and document each check.

"
end
