control "M-6.8" do
  title "6.8 Ensure audit_log_policy is set to log logins (Scored)"
  desc  "With the audit_log_policy setting the amount of information which is
sent to the audit log is controlled.  It must be set to log logins. If this
setting is set to QUERIES or NONE then connections are not written to the audit
log file. "
  impact 0.5
  tag "ref": "1.
https://dev.mysql.com/doc/refman/5.7/en/audit-­‐log-­‐plugin-­‐options-­‐
variables.html#sysvar_audit_log_policy "
  tag "severity": "medium"
  tag "cis_id": "6.8"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "SHOW GLOBAL VARIABLES LIKE 'audit_log_policy'; The result
must be LOGINS or ALL.
"
  tag "fix": "Set audit_log_policy='ALL' or audit_log_policy='LOGINS' in the
MySQL configuration
file and activate the setting by restarting the server or executing SET GLOBAL

audit_log_policy='ALL'; or SET GLOBAL audit_log_policy='LOGINS';
"
  tag "Default Value": "ALL\n"
end
