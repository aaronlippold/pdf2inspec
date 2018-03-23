control "M-7.7" do
  title "7.7 Ensure No Anonymous Accounts Exist (Scored)"
  desc  "Anonymous accounts are users with empty usernames ('').  Anonymous
accounts have no passwords, so anyone can use them to connect to the MySQL
server. Removing anonymous accounts will help ensure that only identified and
trusted principals are capable of interacting with MySQL. "
  impact 0.5
  tag "ref": "1.
http://dev.mysql.com/doc/refman/5.7/en/mysql-­‐secure-­‐installation.html 2.
https://dev.mysql.com/doc/refman/5.6/en/default-­‐privileges.html"
  tag "severity": "medium"
  tag "cis_id": "7.7"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL query to identify anonymous
accounts:
SELECT user,host FROM mysql.user WHERE user = '';
The above query will return zero rows if no anonymous accounts are present.
"
  tag "fix": "Perform the following actions to remediate this setting:
Enumerate the anonymous users returned from executing the audit procedure For
each anonymous user, DROP or assign them a name
NOTE: As an alternative, you may execute the mysql_secure_installation utility.

"
  tag "Default Value": "Using the standard installation script,
mysql_install_db, it will create two anonymous\naccounts: one for the host
'localhost' and the other for the network interface's IP address.\n"
end
