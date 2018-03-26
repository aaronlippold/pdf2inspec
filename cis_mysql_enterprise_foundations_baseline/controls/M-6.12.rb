control "M-6.12" do
  title "6.12 Make sure the audit plugin can't be unloaded (Scored)"
  desc  "Set audit_log to FORCE_PLUS_PERMANENT This makes disables unloading on
the plugin. "
  impact 0.5
  tag "ref": "1.
https://dev.mysql.com/doc/refman/5.7/en/audit-­‐log-­‐plugin-­‐options-­‐
variables.html#option_mysqld_audit-­‐log "
  tag "severity": "medium"
  tag "cis_id": "6.12"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "To assess this recommendation, execute the following SQL
statement:
SELECT LOAD_OPTION FROM information_schema.plugins WHERE
PLUGIN_NAME='audit_log';
The result must be FORCE_PLUS_PERMANENT
"
  tag "fix": "To remediate this setting, follow these steps: Open the MySQL
configuration file (my.cnf) Ensure the following line is found in the mysqld
section
audit_log = 'FORCE_PLUS_PERMANENT'
"
  tag "Default Value": "ON\n"
end
