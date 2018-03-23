control "M-9.3" do
  title "9.3 Ensure 'master_info_repository' Is Set to 'TABLE' (Scored)"
  desc  "The master_info_repository setting determines to where a slave logs
master status and connection information.  The options are FILE or TABLE. Note
also that this setting is associated with the sync_master_info setting as well.
The password which the client uses is stored in the master info repository,
which by default is a plaintext file. The TABLE master info repository is a bit
safer, but with filesystem access it's still possible to gain access to the
password the slave is using. "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/replication-options-
slave.html#sysvar_master_info_repository"
  tag "severity": "medium"
  tag "cis_id": "9.3"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 2
  tag "audit text": "Execute the following SQL statement to assess this
recommendation:
SHOW GLOBAL VARIABLES LIKE 'master_info_repository';
The result should be TABLE instead of FILE.
NOTE: There also should not be a master.info file in the
datadir.
"
  tag "fix": "Perform the following actions to remediate this setting: Open the
MySQL configuration file (my.cnf) Locate master_info_repository Set the
master_info_repository value to TABLE
NOTE: If master_info_repository does not exist, add it to
the configuration file.
"
  tag "Default Value": "FILE\n"
end
