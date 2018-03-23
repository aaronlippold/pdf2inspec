control "M-4.2" do
  title "4.2 Ensure the 'test' Database Is Not Installed (Scored)"
  desc  "The default MySQL installation comes with an unused database called
test. It is recommended that the test database be dropped. The test database
can be accessed by all users and can be used to consume system resources.
Dropping the test database will reduce the attack surface of the MySQL server.
 "
  impact 0.5
  tag "ref": "1.
http://dev.mysql.com/doc/refman/5.7/en/mysql-secure-installation.html"
  tag "severity": "medium"
  tag "cis_id": "4.2"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement to determine if the
test database is present:
SHOW DATABASES LIKE 'test';
The above SQL statement will return zero rows
"
  tag "fix": "Execute the following SQL statement to drop the test
database:
DROP DATABASE 'test';
Note: mysql_secure_installation performs this operation as
well as other security-
related activities.
"
end
