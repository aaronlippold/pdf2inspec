control "M-6.10" do
  title "6.10 Ensure audit_log_statement_policy is set to ALL (Scored)"
  desc  "This setting controls whether statements are written to the audit log
This setting must be set to ALL to ensure all statement information is written
to the audit log. "
  impact 0.5
  tag "ref": "1.
https://dev.mysql.com/doc/refman/5.7/en/audit-­‐log-­‐plugin-­‐options-­‐
variables.html#sysvar_audit_log_statement_policy "
  tag "severity": "medium"
  tag "cis_id": "6.10"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 2
  tag "audit text": "SHOW GLOBAL VARIABLES LIKE 'audit_log_statement_policy';
It must return ALL
"
  tag "fix": "Add this to the mysqld section of the mysql configuration file
and restart the server:
audit_log_statement_policy='ALL'
"
  tag "Default Value": "ALL\n"
end
