control "M-4.8" do
  title "4.8 Ensure 'secure_file_priv' Is Not Empty (Scored)"
  desc  "The secure_file_priv option restricts to paths used by LOAD DATA
INFILE or SELECT local_file. It is recommended that this option be set to a
file system location that contains only resources expected to be loaded by
MySQL. Setting secure_file_priv reduces an attacker's ability to read sensitive
files off the affected server via a SQL injection vulnerability. "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/server-­‐system-­‐
variables.html#sysvar_secure_file_priv"
  tag "severity": "medium"
  tag "cis_id": "4.8"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement and ensure one row is
returned:
SHOW GLOBAL VARIABLES WHERE Variable_name = 'secure_file_priv' AND Value<>'';
Note: The Value should contain a valid path.
"
  tag "fix": "Add the following line to the [mysqld] section of the MySQL
configuration file and restart
the MySQL service:
secure_file_priv=<path_to_load_directory> "
  tag "Default Value": "No value set.\n\n"
end
