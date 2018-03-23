control "M-2.1.6" do
  title "2.1.6 Disaster recovery plan (Not Scored)"
  desc  "A disaster recovery plan should be created. A slave in a different
datacenter can be used or offsite backups. There should be information about
what time a recovery will take and if the recovery site has the same capacity.
A disaster recovery should be planned. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "2.1.6"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Check if there is a disaster recovery plan
"
  tag "fix": "Create a disaster recovery plan
"
end
