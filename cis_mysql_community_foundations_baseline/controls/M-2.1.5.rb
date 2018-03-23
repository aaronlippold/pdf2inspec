control "M-2.1.5" do
  title "2.1.5 Point in time recovery (Not Scored)"
  desc  "With binlogs it is possible to implement point-in-time recovery. This
makes it possible to restore the changes between the last full backup and the
point-in-time. Enabling binlogs is not sufficient, a restore procedure should
be created and has to be tested. This can reduce the amount of information
lost.  "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "2.1.5"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 2
  tag "audit text": "Check if binlogs are enabled and if there is a
restore procedure.
"
  tag "fix": "Enable binlogs and create and test a restore procedure.
"
end
