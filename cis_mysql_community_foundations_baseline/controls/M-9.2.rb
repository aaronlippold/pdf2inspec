control "M-9.2" do
  title "9.2 Ensure 'MASTER_SSL_VERIFY_SERVER_CERT' Is Set to 'YES' or '1'
(Scored)"
  desc  "In the MySQL slave context the setting MASTER_SSL_VERIFY_SERVER_CERT
indicates whether the slave should verify the master's certificate.  This
configuration item may be set to Yes or No, and unless SSL has been enabled on
the slave, the value will be ignored. When SSL is in use certificate
verification is important to authenticate the party to which a connection is
being made.  In this case, the slave (client) should verify the master's
(server's) certificate to authenticate the master prior to continuing the
connection. "
  impact 0.5
  tag "ref": "1.
https://dev.mysql.com/doc/refman/5.6/en/change-­‐master-­‐to.html"
  tag "severity": "medium"
  tag "cis_id": "9.2"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "To assess this recommendation, issue the following
statement:
select ssl_verify_server_cert from mysql.slave_master_info; Verify the value of
ssl_verify_server_cert is 1.
"
  tag "fix": "To remediate this setting you must use the CHANGE MASTER TO
command.
STOP SLAVE; -- required if replication was already running
CHANGE MASTER TO MASTER_SSL_VERIFY_SERVER_CERT=1;
START SLAVE; -- required if you want to restart replication
"
end
