control "M-4.3" do
  title "4.3 Ensure 'allow-­‐suspicious-­‐udfs' Is Set to 'FALSE' (Scored)"
  desc  "This option prevents attaching arbitrary shared library functions as
user-­‐defined functions by checking for at least one corresponding method
named _init, _deinit, _reset, _clear, or _add. Preventing shared libraries that
do not contain user-­‐defined functions from loading will reduce the attack
surface of the server. "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/udf-­‐security.html 2.
http://dev.mysql.com/doc/refman/5.7/en/server-­‐
options.html#option_mysqld_allow-­‐suspicious-­‐udfs"
  tag "severity": "medium"
  tag "cis_id": "4.3"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 2
  tag "audit text": "Perform the following to determine if the recommended
state is in place:
Ensure --allow-suspicious-udfs is not specified in the the mysqld start
up command line.
Ensure allow-suspicious-udfs is set to FALSE in the MySQL configuration.

"
  tag "fix": "Perform the following to establish the recommended state:
Remove --allow-suspicious-udfs from the mysqld start up command line.
Remove allow-suspicious-udfs from the MySQL option file.
"
  tag "Default Value": "FALSE\n"
end
