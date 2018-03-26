control "M-4.6" do
  title "4.6 Ensure '-­‐-­‐skip-­‐symbolic-­‐links' Is Enabled (Scored)"
  desc  "The symbolic-­‐links and skip-­‐symbolic-­‐links options for MySQL
determine whether symbolic link support is available.  When use of symbolic
links are enabled, they have different effects depending on the host platform.
When symbolic links are disabled, then symbolic links stored in files or
entries in tables are not used by the database. Prevents sym links being used
for data base files. This is especially important when MySQL is executing as
root as arbitrary files may be overwritten.  The symbolic-­‐links option might
allow someone to direct actions by to MySQL server to other files and/or
directories. "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/symbolic-­‐links.html
2. http://dev.mysql.com/doc/refman/5.7/en/server-­‐
options.html#option_mysqld_symbolic-­‐links "
  tag "severity": "medium"
  tag "cis_id": "4.6"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement to assess this
recommendation:
SHOW variables LIKE 'have_symlink';
Ensure the Value returned is DISABLED.
"
  tag "fix": "Perform the following actions to remediate this setting: Open the
MySQL configuration file (my.cnf)
Locate skip_symbolic_links in the configuration
Set the skip_symbolic_links to YES
NOTE: If skip_symbolic_links does not exist, add it to the configuration file
in the mysqld
section.
"
end
