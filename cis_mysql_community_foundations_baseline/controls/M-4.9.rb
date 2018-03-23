control "M-4.9" do
  title "4.9 Ensure 'sql_mode' Contains 'STRICT_ALL_TABLES' (Scored)"
  desc  "When data changing statements are made (i.e. INSERT, UPDATE), MySQL
can handle invalid or missing values differently depending on whether strict
SQL mode is enabled.  When strict SQL mode is enabled, data may not be
truncated or otherwise 'adjusted' to make the data changing statement work.
Without strict mode the server tries to do proceed with the action when an
error might have been a more secure choice. For example, by default MySQL will
truncate data if it does not fit in a field, which can lead to unknown
behavior, or be leveraged by an attacker to circumvent data validation. "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/sql-­‐mode.html"
  tag "severity": "medium"
  tag "cis_id": "4.9"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 2
  tag "audit text": "To audit for this recommendation execute the following
query:
SHOW VARIABLES LIKE 'sql_mode';
Ensure that STRICT_ALL_TABLES is in the list returned.
"
  tag "fix": "Perform the following actions to remediate this setting: Add
STRICT_ALL_TABLES to the sql_mode in the server's configuration file
"
end
