control "M-6.9" do
  title "6.9 Ensure audit_log_policy is set to log logins and connections
(Scored)"
  desc  "With the audit_log_policy setting the amount of information which is
sent to the audit log is controlled.  It must be set to log logins and
connections. If this setting is set to QUERIES, CONNECTIONS or NONE then either
connections or queries are not written to the audit log file. "
  impact 0.5
  tag "ref": "1.
https://dev.mysql.com/doc/refman/5.7/en/audit-­‐log-­‐plugin-­‐options-­‐
variables.html#sysvar_audit_log_policy "
  tag "severity": "medium"
  tag "cis_id": "6.9"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 2
  tag "audit text": "SHOW GLOBAL VARIABLES LIKE 'audit_log_policy'; The result
must be ALL.
"
  tag "fix": "Set audit_log_policy='ALL' in the MySQL configuration file and
activate the setting by
restarting the server or executing SET GLOBAL audit_log_policy='ALL';
"
  tag "Default Value": "ALL\n"
end
