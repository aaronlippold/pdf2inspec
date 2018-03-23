control "M-6.1" do
  title "6.1 Ensure 'log_error' Is Not Empty (Scored)"
  desc  "The error log contains information about events such as mysqld
starting and stopping, when a table needs to be checked or repaired, and,
depending on the host operating system, stack traces when mysqld fails.
Enabling error logging may increase the ability to detect malicious attempts
against MySQL, and other critical messages, such as if the error log is not
enabled then connection error might go unnoticed. "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/error-log.html"
  tag "severity": "medium"
  tag "cis_id": "6.1"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement to audit this setting:

SHOW variables LIKE 'log_error';

Ensure the Value returned is not empty.
"
  tag "fix": "Perform the following actions to remediate this setting: Open the
MySQL configuration file (my.cnf or my.ini) Set the log-error option to the
path for the error log
"
end
