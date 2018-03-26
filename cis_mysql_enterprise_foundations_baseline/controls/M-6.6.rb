control "M-6.6" do
  title "6.6 Ensure audit_log_exclude_accounts is set to NULL (Scored)"
  desc  "The audit_log_exclude_accounts variable enables the administrator to
set accounts for which events will not be logged in the audit log. The
audit_log_exclude_accounts variable has two permitted values, either NULL or a
list of MySQL accounts. Setting this variable correctly ensures no single user
is able to unintentionally evade being logged. Particular attention should be
made to privileged accounts, as such accounts will generally be bestowed with
more privileges than normal users, and should not be listed against this
variable. "
  impact 0.5
  tag "ref": "1.
https://dev.mysql.com/doc/refman/5.7/en/audit-­‐log-­‐plugin-­‐options-­‐
variables.html#sysvar_audit_log_exclude_accounts "
  tag "severity": "medium"
  tag "cis_id": "6.6"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "To assess this recommendation, execute the following SQL
statement:
SHOW VARIABLES LIKE '%audit_log_exclude_accounts%';
Ensure the resulting audit_log_exclude_accounts value is NULL.
"
  tag "fix": "To remediate this configuration setting, execute the following
SQL statement
SET GLOBAL audit_log_exclude_accounts = NULL Or set
audit_log_exclude_accounts=NULL in my.cnf.
"
  tag "Default Value": "audit_log_exclude_accounts is set to NULL by
default.\n\n"
end
