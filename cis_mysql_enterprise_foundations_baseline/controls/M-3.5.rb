control "M-3.5" do
  title "3.5 Ensure 'relay_log_basename' Files Have Appropriate Permissions and
Ownership (Scored)"
  desc  "MySQL can operate using a variety of log files, each used for
different purposes.  These are the binary log, error log, slow query log, relay
log, audit log and general log.  Because these are files on the host operating
system, they are subject to the permissions and ownership structure provided by
the host and may be accessible by users other than the MySQL user. Limiting the
accessibility of these objects will protect the confidentiality, integrity, and
availability of the MySQL logs. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "3.5"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Perform the following steps to assess this recommendation:
Execute the following SQL statement to determine the Value of
relay_log_basename
show variables like 'relay_log_basename'; Execute the following command at a
terminal prompt to list all relay_log_basename.*
files
ls <relay_log_basename>.* For each file listed, execute the following command
ls -l <relay_log_basename> | egrep '^-[r|w]{2}-[r|w]{2}----\\s*.*$'
Lack of output implies a finding.
"
  tag "fix": "Execute the following command for each log file location
requiring corrected permissions
and ownership:
chmod 660 <log file>
chown mysql:mysql <log file>
"
end
