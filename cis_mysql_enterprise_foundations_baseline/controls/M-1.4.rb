control "M-1.4" do
  title "1.4 Verify that 'MYSQL_PWD' Is Not Set (Scored)"
  desc  "MySQL can read a default database password from an environment
variable called MYSQL_PWD. Avoiding use of this environment variable can better
safeguard the confidentiality of MySQL credentials. The use of the MYSQL_PWD
environment variable implies the clear text storage of MySQL credentials. "
  impact 0.5
  tag "ref": "1.
http://dev.mysql.com/doc/refman/5.7/en/environment-­‐variables.html 2.
https://blogs.oracle.com/myoraclediary/entry/how_to_check_environment_variabl
es "
  tag "severity": "medium"
  tag "cis_id": "1.4"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "To assess this recommendation, use the /proc filesystem to
determine if MYSQL_PWD is
currently set for any process
grep MYSQL_PWD /proc/*/environ
This may return one entry for the process which is executing the grep command.

"
  tag "fix": "Check which users and/or scripts are setting MYSQL_PWD and change
them to use a more
secure method.
"
  tag "Default Value": "Not set.\n"
end
