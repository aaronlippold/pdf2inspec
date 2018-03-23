control "M-2.1.7" do
  title "2.1.7 Backup of configuration and related files (Not Scored)"
  desc  "The following files should be included in the backup:  Configuration
files (my.cnf and included files)  SSL files (certificates, keys)  User Defined
Functions (UDFs)  Source code for customizations These files are required to be
able to fully restore an instance. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "2.1.7"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Check if these files are in used and are saved in the
backup.
"
  tag "fix": "Add these files to the backup
"
end
