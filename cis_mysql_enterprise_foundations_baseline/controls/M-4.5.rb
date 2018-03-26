control "M-4.5" do
  title "4.5 Ensure 'mysqld' Is Not Started with '-­‐-­‐skip-­‐grant-­‐tables'
(Scored)"
  desc  "This option causes mysqld to start without using the privilege system.
If this option is used, all clients of the affected server will have
unrestricted access to all databases. "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/server-­‐
options.html#option_mysqld_skip-­‐grant-­‐tables "
  tag "severity": "medium"
  tag "cis_id": "4.5"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Perform the following to determine if the recommended
state is in place:
Open the MySQL configuration (e.g. my.cnf) file and search for
skip-­‐grant-­‐tables
Ensure skip-grant-tables is set to FALSE
"
  tag "fix": "Perform the following to establish the recommended state: Open
the MySQL configuration (e.g. my.cnf) file and set:
skip-grant-tables = FALSE
"
end
