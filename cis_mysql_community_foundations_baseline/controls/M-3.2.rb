control "M-3.2" do
  title "3.2 Ensure 'log_bin_basename' Files Have Appropriate Permissions
(Scored)"
  desc  "MySQL can operate using a variety of log files, each used for
different purposes.  These are the binary log, error log, slow query log, relay
log, and general log.  Because these are files on the host operating system,
they are subject to the permissions structure provided by the host and may be
accessible by users other than the MySQL user. Limiting the accessibility of
these objects will protect the confidentiality, integrity, and availability of
the MySQL logs. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "3.2"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Perform the following steps to assess this recommendation:
Identify the basename of binary log files (log_bin_basename)by executing the
following statement
show variables like 'log_bin_basename'; Verify permissions are 660 for
mysql:mysql on each log file of the form
log_bin_basename.nnnnnn.
"
  tag "fix": "Execute the following command for each log file location
requiring corrected permissions:
chmod 660 <log file>
chown mysql:mysql <log file>
"
end
