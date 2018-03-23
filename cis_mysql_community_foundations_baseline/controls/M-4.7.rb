control "M-4.7" do
  title "4.7 Ensure the 'daemon_memcached' Plugin Is Disabled (Scored)"
  desc  "The InnoDB memcached Plugin allows users to access data stored in
InnoDB with the memcached protocol. By default the plugin doesn't do
authentication, which means that anyone with access to the TCP/IP port of the
plugin can access and modify the data. However, not all data is exposed by
default. "
  impact 0.5
  tag "ref": "1.
http://dev.mysql.com/doc/refman/5.7/en/innodb-­‐memcached-­‐security.html"
  tag "severity": "medium"
  tag "cis_id": "4.7"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement to assess this
recommendation:
SELECT * FROM information_schema.plugins WHERE PLUGIN_NAME='daemon_memcached'
Ensure that no rows are returned.
"
  tag "fix": "To remediate this setting, issue the following command in the
MySQL command-­‐line client:
uninstall plugin daemon_memcached;
This uninstalls the memcached plugin from the MySQL server.
"
  tag "Default Value": "disabled\n"
end
