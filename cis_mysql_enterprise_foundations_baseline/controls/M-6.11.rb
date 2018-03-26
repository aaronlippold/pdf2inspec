control "M-6.11" do
  title "6.11 Set audit_log_strategy to SYNCHRONOUS or SEMISYNCRONOUS (Scored)"
  desc  "The audit_log_strategy must be set to SYNCHRONOUS or SEMISYNCHRONOUS
This setting controls how information is written to the audit log. It can be
set to SYNCHRONOUS to make it fully durable or other settings which are less
durable but have less performance overhead. "
  impact 0.5
  tag "ref": "1.
https://dev.mysql.com/doc/refman/5.7/en/audit-­‐log-­‐plugin-­‐options-­‐
variables.html#sysvar_audit_log_strategy "
  tag "severity": "medium"
  tag "cis_id": "6.11"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 2
  tag "audit text": "To assess this recommendation, execute the following SQL
statement:
SHOW GLOBAL VARIABLES LIKE 'audit_log_strategy';
The result should be SYNCHRONOUS or SEMISYNCHRONOUS
"
  tag "fix": "To remediate this configuration: Open the MySQL configuration
file (my.cnf) Navigate to the mysqld section of the configuration file Set
audit_log_strategy='SEMISYNCHRONOUS' (or SYNCHRONOUS)
"
  tag "Default Value": "ASYNCHRONOUS\n"
end
