control "M-7.1" do
  title "7.1 Ensure 'old_passwords' Is Not Set to '1' (Scored)"
  desc  "This variable controls the password hashing method used by the
PASSWORD() function and for the IDENTIFIED BY clause of the CREATE USER and
GRANT statements. The value can be one of the following: 0 -­‐ authenticate
with the mysql_native_password plugin 1 -­‐ authenticate with the
mysql_old_password plugin 2 -­‐ authenticate with the sha256_password plugin
The mysql_old_password plugin leverages a very weak hashing algorithm that can
be quickly brute forced using an offline dictionary attack. See
CVE-­‐2003-­‐1480 for additional details. "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/server-­‐system-­‐
variables.html#sysvar_old_passwords 2. CVE-­‐2003-­‐1480 "
  tag "severity": "medium"
  tag "cis_id": "7.1"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement to assess this
recommendation:
SHOW VARIABLES WHERE Variable_name = 'old_passwords';
Ensure the Value field is not set to 1.
"
  tag "fix": "Configure mysql to leverage the mysql_native_password or
sha256_password plugin. For
more information, see:
http://dev.mysql.com/doc/refman/5.6/en/password-­‐hashing.html
http://dev.mysql.com/doc/refman/5.6/en/sha256-­‐authentication-­‐plugin.html

"
  tag "Default Value": "0\n"
end
