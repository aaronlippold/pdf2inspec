control "M-6.5" do
  title "6.5 Ensure audit_log_connection_policy is not set to 'NONE' (Scored)"
  desc  "The audit_log_connection_policy variable controls how the audit plugin
writes connection events to the audit log file. The audit_log_connection_policy
offers three options: NONE, ERRORS, and ALL. Each option determines whether
connection events are logged and the type of connection events that are logged.
Setting a non 'NONE' value for audit_log_connection_policy ensures at a
minimum, failed connection events are being logged.  The ERRORS setting will
log failed connection events and the ALL setting will log all connection
events. For MySQL versions => 5.6.20, the audit_log_policy variable can
override the audit_log_connection_policy, potentially invalidating this
benchmark recommendation, therefore enforcing a setting for
audit_log_connection_policy ensures the integrity of this recommendation. "
  impact 0.5
  tag "ref": "1.
https://dev.mysql.com/doc/refman/5.7/en/audit-­‐log-­‐plugin-­‐options-­‐
variables.html#sysvar_audit_log_connection_policy 2.
https://dev.mysql.com/doc/refman/5.7/en/audit-­‐log-­‐plugin-­‐logging-­‐control.html
"
  tag "severity": "medium"
  tag "cis_id": "6.5"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "To assess this recommendation, execute the following SQL
statement:
show variables like '%audit_log_connection_policy%'; Ensure the value is set to
either ERRORS or ALL.
"
  tag "fix": "To remediate this configuration setting, execute one of the
following SQL statements:
set global audit_log_connection_policy = ERRORS
Or
set global audit_log_connection_policy = ALL To ensure this remediation remains
indefinite for the life of the MySQL Server, set
audit_log_connection_policy in the server's assigned MySQL configuration file
(usually
named my.cnf, but not always).

"
  tag "Default Value": "The default value for audit_log_connection_policy is
ALL.\n"
end
