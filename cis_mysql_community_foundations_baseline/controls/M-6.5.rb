control "M-6.5" do
  title "6.5 Ensure 'log-raw' Is Set to 'OFF' (Scored)"
  desc  "The log-raw MySQL option determines whether passwords are rewritten by
the server so as not to appear in log files as plain text.  If log-raw is
enabled, then passwords are written to the various log files (general query
log, slow query log, and binary log) in plain text. With raw logging of
passwords enabled someone with access to the log files might see plain text
passwords. "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/password-logging.html
2. http://dev.mysql.com/doc/refman/5.7/en/server-
options.html#option_mysqld_log-raw"
  tag "severity": "medium"
  tag "cis_id": "6.5"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Perform the following actions to assess this
recommendation:
 Open the MySQL configuration file (my.cnf)
 Ensure the log-raw entry is present
 Ensure the log-raw entry is set to OFF
"
  tag "fix": "Perform the following actions to remediate this setting:
 Open the MySQL configuration file (my.cnf)
 Find the log-raw entry and set it as follows
log-raw = OFF
"
  tag "Default Value": "OFF\n\n"
end
