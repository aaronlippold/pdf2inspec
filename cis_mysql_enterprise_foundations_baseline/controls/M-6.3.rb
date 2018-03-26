control "M-6.3" do
  title "6.3 Ensure 'log_warnings' Is Set to '2' (Scored)"
  desc  "The log_warnings system variable, enabled by default, provides
additional information to the MySQL log.  A value of 1 enables logging of
warning messages, and higher integer values tend to enable more logging. NOTE:
log_warnings has been deprecated as of MySQL 5.7.2. Setting log_warnings will
also cause log_error_verbosity to be set.The variable scope for log_warnings is
global. This might help to detect malicious behavior by logging communication
errors and aborted connections. "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/server-­‐
options.html#option_mysqld_log-­‐warnings "
  tag "severity": "medium"
  tag "cis_id": "6.3"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 2
  tag "audit text": "Execute the following SQL statement to assess this
recommendation:
SHOW GLOBAL VARIABLES LIKE 'log_warnings';
Ensure the Value returned equals 2.
"
  tag "fix": "Perform the following actions to remediate this setting:
Open the MySQL configuration file (my.cnf)
Ensure the following line is found in the mysqld section
log-warnings = 2
"
  tag "Default Value": "The option is enabled (1) by default.\n"
end
