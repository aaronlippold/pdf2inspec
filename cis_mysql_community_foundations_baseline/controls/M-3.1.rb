control "M-3.1" do
  title "3.1 Ensure 'datadir' Has Appropriate Permissions (Scored)"
  desc  "The data directory is the location of the MySQL databases. Limiting
the accessibility of these objects will protect the confidentiality, integrity,
and availability of the MySQL database.  If someone other than the MySQL user
is allowed to read files from the data directory he or she might be able to
read data from the mysql.user table which contains passwords.  Additionally,
the ability to create files can lead to denial of service, or might otherwise
allow someone to gain access to specific data by manually creating a file with
a view definition. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "3.1"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Perform the following steps to assess this recommendation:
Execute the following SQL statement to determine the Value of datadir
show variables where variable_name = 'datadir'; Execute the following command
at a terminal prompt
ls -l <datadir>/.. | egrep
'^d[r|w|x]{3}------\\s*.\\s*mysql\\s*mysql\\s*\\d*.*mysql'
Lack of output implies a finding.
"
  tag "fix": "Execute the following commands at a terminal prompt:
chmod 700 <datadir>
chown mysql:mysql <datadir> "
end
