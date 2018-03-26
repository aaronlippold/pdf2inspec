control "M-7.3" do
  title "7.3 Ensure Passwords Are Not Stored in the Global Configuration
(Scored)"
  desc  "The [client] section of the MySQL configuration file allows setting a
user and password to be used. Verify the password option is not used in the
global configuration file (my.cnf). The use of the password parameter may
negatively impact the confidentiality of the user's password. "
  impact 0.5
  tag "ref": "1.
http://dev.mysql.com/doc/refman/5.7/en/mysql-­‐config-­‐editor.html "
  tag "severity": "medium"
  tag "cis_id": "7.3"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "To assess this recommendation, perform the following
steps:
Open the MySQL configuration file (e.g. my.cnf)
Examine the [client] section of the MySQL configuration file and ensure
password
is not employed.
"
  tag "fix": "Use the mysql_config_editor to store authtentication credentials
in .mylogin.cnf in
encrypted form.
If not possible, use the user-­‐specific options file, .my.cnf., and
restricting file access
permissions to the user identity.
"
end
