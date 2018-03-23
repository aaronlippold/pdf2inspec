control "M-8.1" do
  title "8.1 Ensure 'have_ssl' Is Set to 'YES' (Scored)"
  desc  "All network traffic must use SSL/TLS when traveling over untrusted
networks. The SSL/TLS-protected MySQL protocol helps to prevent eavesdropping
and man-in-the- middle attacks.  "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/ssl-connections.html 2.
http://dev.mysql.com/doc/refman/5.7/en/ssl-options.html"
  tag "severity": "medium"
  tag "cis_id": "8.1"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statements to assess this
recommendation:
SHOW variables WHERE variable_name = 'have_ssl';
Ensure the Value returned is YES.
NOTE: have_openssl is an alias for have_ssl as of MySQL0.38.  MySQL can be
build
with OpenSSL or YaSSL.
"
  tag "fix": "Follow the procedures as documented in the MySQL 5.6
Reference Manual to setup SSL.
"
  tag "Default Value": "DISABLED\n"
end
