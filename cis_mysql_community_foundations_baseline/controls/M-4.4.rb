control "M-4.4" do
  title "4.4 Ensure 'local_infile' Is Disabled (Scored)"
  desc  "The local_infile parameter dictates whether files located on the MySQL
client's computer can be loaded or selected via LOAD DATA INFILE or SELECT
local_file.  Disabling local_infile reduces an attacker's ability to read
sensitive files off the affected server via a SQL injection vulnerability. "
  impact 0.5
  tag "ref": "1.
http://dev.mysql.com/doc/refman/5.7/en/string-functions.html#function_load-file
2. http://dev.mysql.com/doc/refman/5.7/en/load-data.html"
  tag "severity": "medium"
  tag "cis_id": "4.4"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement and ensure the Value
field
is set to OFF:
SHOW VARIABLES WHERE Variable_name = 'local_infile';
"
  tag "fix": "Add the following line to the [mysqld] section of
the MySQL configuration file and restart
the MySQL service:
local-infile=0

"
  tag "Default Value": "ON\n"
end
