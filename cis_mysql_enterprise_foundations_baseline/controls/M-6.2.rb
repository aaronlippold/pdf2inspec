control "M-6.2" do
  title "6.2 Ensure Log Files Are Stored on a Non-­‐System Partition (Scored)"
  desc  "MySQL log files can be set in the MySQL configuration to exist
anywhere on the filesystem.  It is common practice to ensure that the system
filesystem is left uncluttered by application logs.  System filesystems include
the root, /var, or /usr. Moving the MySQL logs off the system partition will
reduce the probability of denial of service via the exhaustion of available
disk space to the operating system. "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/binary-­‐log.html 2.
http://dev.mysql.com/doc/refman/5.7/en/replication-­‐options-­‐binary-­‐log.html
"
  tag "severity": "medium"
  tag "cis_id": "6.2"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement to assess this
recommendation:
SELECT @@global.log_bin_basename;
Ensure the value returned does not indicate root ('/'), /var, or /usr.
"
  tag "fix": "Perform the following actions to remediate this setting: Open the
MySQL configuration file (my.cnf) Locate the log-bin entry and set it to a file
not on root ('/'), /var, or /usr
"
end
