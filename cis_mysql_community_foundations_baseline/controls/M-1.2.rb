control "M-1.2" do
  title "1.2 Use Dedicated Least Privileged Account for MySQL Daemon/Service
(Scored)"
  desc  "As with any service installed on a host, it can be provided with its
own user context.  Providing a dedicated user to the service provides the
ability to precisely constrain the service within the larger host context.
Utilizing a least privilege account for MySQL to execute as may reduce the
impact of a MySQL-­‐born vulnerability. A restricted account will be unable to
access resources unrelated to MySQL, such as operating system configurations. "
  impact 0.5
  tag "ref": "1.
http://dev.mysql.com/doc/refman/5.7/en/changing-­‐mysql-­‐user.html 2.
http://dev.mysql.com/doc/refman/5.7/en/server-­‐
options.html#option_mysqld_user"
  tag "severity": "medium"
  tag "cis_id": "1.2"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following command at a terminal prompt to
assess this recommendation:
ps -ef | egrep '^mysql.*$'
If no lines are returned, then this is a finding.
NOTE: It is assumed that the MySQL user is mysql.  Additionally, you may
consider running
sudo -l as the MySQL user or to check the sudoers file.
"
  tag "fix": "Create a user which is only used for running MySQL and directly
related processes. This
user must not have administrative rights to the system.
"
end
