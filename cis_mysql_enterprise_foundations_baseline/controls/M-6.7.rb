control "M-6.7" do
  title "6.7 Ensure audit_log_include_accounts is set to NULL (Scored)"
  desc  "The audit_log_include_accounts variable enables the administrator to
set accounts for which events should be logged in the audit log. The
audit_log_include_accounts variable has two permitted values, either NULL or a
list of MySQL accounts. Setting this variable correctly ensures all MySQL users
are being logged in the audit log. "
  impact 0.5
  tag "ref": "1.
https://dev.mysql.com/doc/refman/5.7/en/audit-­‐log-­‐plugin-­‐options-­‐
variables.html#sysvar_audit_log_include_accounts "
  tag "severity": "medium"
  tag "cis_id": "6.7"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "To assess this recommendation, execute the following SQL
statement:
SHOW VARIABLES LIKE '%audit_log_include_accounts%';
Ensure the resulting value is NULL.
"
  tag "fix": "To remediate this configuration setting, execute the following
SQL statement
SET GLOBAL audit_log_include_accounts = NULL Or set
audit_log_include_accounts=NULL in my.cnf.
"
  tag "Default Value": "audit_log_exclude_accounts is set to NULL by
default.\n\n"
end
