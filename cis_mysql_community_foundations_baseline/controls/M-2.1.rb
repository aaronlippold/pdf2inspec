control "M-2.1" do
  title "2.1 Backup and Disaster Recovery This section contains recommendations
related to backup and recovery  2.1.1 Backup policy in place (Not Scored)"
  desc  "A backup policy should be in place. Backing up MySQL databases,
including 'mysql', will help ensure the availability of data in the event of an
incident. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "2.1"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Check with 'crontab -l' if there is a backup schedule.
"
  tag "fix": "Create a backup policy and backup schedule.
"
end
