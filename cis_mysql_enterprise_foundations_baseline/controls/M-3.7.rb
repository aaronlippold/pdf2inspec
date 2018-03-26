control "M-3.7" do
  title "3.7 Ensure SSL Key Files Have Appropriate Permissions and Ownership
(Scored)"
  desc  "When configured to use SSL/TLS, MySQL relies on key files, which are
stored on the host's filesystem.  These key files are subject to the host's
permissions and ownership structure. Limiting the accessibility of these
objects will protect the confidentiality, integrity, and availability of the
MySQL database and the communication with the client. If the contents of the
SSL key file is known to an attacker he or she might impersonate the server.
This can be used for a man-­‐in-­‐the-­‐midddle attack. Depending on the SSL
ciphersuite the key might also be used to decipher previously captured network
traffic. "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/ssl-­‐connections.html "
  tag "severity": "medium"
  tag "cis_id": "3.7"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "To assess this recommendation, locate the SSL key in use
by executing the following SQL
statement to get the Value of ssl_key:
show variables where variable_name = 'ssl_key';
Then, execute the following command to assess the permissions of the Value:
ls -l <ssl_key Value> | egrep '^-r--------[ \\t]*.[ \\t]*mysql[ \\t]*mysql.*$'

Lack of output from the above command implies a finding.
"
  tag "fix": "Execute the following commands at a terminal prompt to remediate
these settings using
the Value from the audit procedure:
chown mysql:mysql <ssl_key Value>
chmod 400 <ssl_key Value>
"
end
