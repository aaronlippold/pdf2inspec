control "M-7.2" do
  title "7.2 Ensure 'secure_auth' is set to 'ON' (Scored)"
  desc  "This option dictates whether the server will deny connections by
clients that attempt to use accounts that have their password stored in the
mysql_old_password format. Enabling this option will prevent all use of
passwords employing the old format (and hence insecure communication over the
network). "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/server-­‐
options.html#option_mysqld_secure-­‐auth "
  tag "severity": "medium"
  tag "cis_id": "7.2"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement and ensure the Value
field is not set to ON:
SHOW VARIABLES WHERE Variable_name = 'secure_auth';
"
  tag "fix": "Add the following line to [mysqld] portions of the MySQL option
file to establish the
recommended state:
secure_auth=ON "
  tag "Default Value": "Before MySQL 5.6.5, this option is disabled by default.
As of MySQL 5.6.5, it is enabled by\ndefault; to disable it, use
--skip-secure-auth.\n"
end
