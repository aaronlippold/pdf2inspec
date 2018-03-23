control "M-6.3" do
  title "6.3 Ensure 'log_error_verbosity' Is Not Set to '1' (Scored)"
  desc  "The log_error_verbosity system variable provides additional
information to the MySQL log.  A value of 1 enables logging of error messages.
A value of 2 enables logging of error and warning messages, and a value of 3
enables logging of error, warning and note messages. This might help to detect
malicious behavior by logging communication errors and aborted connections. "
  impact 0.5
  tag "ref": "1. https://dev.mysql.com/doc/refman/5.7/en/server-­‐system-­‐
variables.html#sysvar_log_error_verbosity"
  tag "severity": "medium"
  tag "cis_id": "6.3"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 2
  tag "audit text": "Execute the following SQL statement to assess this
recommendation:
SHOW GLOBAL VARIABLES LIKE 'log_error_verbosity';
Ensure the Value returned equals 2 or 3.
"
  tag "fix": "Perform the following actions to remediate this setting:
Open the MySQL configuration file (my.cnf)
Ensure the following line is found in the mysqld section
log_error_verbosity = 2
The value can be 2 or 3.
"
  tag "Default Value": "The option is error+warning (2) by default.\n\n"
end
