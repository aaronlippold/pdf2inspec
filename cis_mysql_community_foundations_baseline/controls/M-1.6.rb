control "M-1.6" do
  title "1.6 Verify That 'MYSQL_PWD' Is Not Set In Users' Profiles (Scored)"
  desc  "MySQL can read a default database password from an environment
variable called MYSQL_PWD. The use of the MYSQL_PWD environment variable
implies the clear text storage of MySQL credentials. Avoiding this may increase
assurance that the confidentiality of MySQL credentials is preserved.  "
  impact 0.5
  tag "ref": "1.
http://dev.mysql.com/doc/refman/5.7/en/environment-­‐variables.html 2.
https://blogs.oracle.com/myoraclediary/entry/how_to_check_environment_variabl
es"
  tag "severity": "medium"
  tag "cis_id": "1.6"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "To assess this recommendation check if MYSQL_PWD is set in
login scripts using the
following command:
grep MYSQL_PWD /home/*/.{bashrc,profile,bash_profile}
"
  tag "fix": "Check which users and/or scripts are setting MYSQL_PWD and change
them to use a more
secure method.
"
  tag "Default Value": "Not set.\n"
end
