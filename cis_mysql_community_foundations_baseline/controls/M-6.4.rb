control "M-6.4" do
  title "6.4 Ensure Audit Logging Is Enabled (Not Scored)"
  desc  "Audit logging is not really included in the Community Edition of MySQL
-­‐ only the general log.  Using the general log is possible, but not
practical, because it grows quickly and has an adverse impact on server
performance. Nevertheless, enabling audit logging is an important consideration
for a production environment, and third-­‐party tools do exist to help with
this. Enable audit logging for Interactive user sessions Application sessions
(optional) Audit logging helps to identify who changed what and when. The audit
log might be used as evidence in investigations. It might also help to identify
what an attacker was able to accomplish. "
  impact 0.5
  tag "ref": "1. 2. 3. 4.
http://dev.mysql.com/doc/refman/5.7/en/query-­‐log.html
http://dev.mysql.com/doc/refman/5.7/en/mysql-­‐enterprise-­‐audit.html
https://mariadb.com/kb/en/server_audit-­‐mariadb-­‐audit-­‐plugin/
https://github.com/mcafee/mysql-­‐audit"
  tag "severity": "medium"
  tag "cis_id": "6.4"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 2
  tag "audit text": "Verify that a third-­‐party tool is installed and
configured to enable logging for interactive
user sessions and (optionally) applications sessions.
"
  tag "fix": "Acquire a third-­‐party MySQL logging solution as available from
a variety of sources
including, but not necessarily limited to, the following:
The General Query Log
MySQL Enterprise Audit
MariaDB Audit Plugin for MySQL
McAfee MySQL Audit

"
end
