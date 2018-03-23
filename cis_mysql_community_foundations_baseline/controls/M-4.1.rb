control "M-4.1" do
  title "4.1 Ensure Latest Security Patches Are Applied (Not Scored)"
  desc  "Periodically, updates to MySQL server are released to resolve bugs,
mitigate vulnerabilities, and provide new features. It is recommended that
MySQL installations are up to date with the latest security updates.
Maintaining currency with MySQL patches will help reduce risk associated with
known vulnerabilities present in the MySQL server.  Without the latest security
patches MySQL might have known vulnerabilities which might be used by an
attacker to gain access. "
  impact 0.5
  tag "ref": "1.
http://www.oracle.com/technetwork/topics/security/alerts-­‐086861.html 2.
http://dev.mysql.com/doc/relnotes/mysql/5.6/en/ 3.
http://web.nvd.nist.gov/view/vuln/search-­‐
results?adv_search=true&cves=on&cpe_vendor=cpe%3a%2f%3aoracle&cpe_produ
ct=cpe%3a%2f%3aoracle%3amysql&cpe_version=cpe%3a%2f%3aoracle%3amysq l%3a5.6.0"
  tag "severity": "medium"
  tag "cis_id": "4.1"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement to identify the MySQL
server version:
SHOW VARIABLES WHERE Variable_name LIKE 'version'; Now compare the version with
the security announcements from Oracle and/or the OS if
the OS packages are used.
"
  tag "fix": "Install the latest patches for your version or upgrade to the
latest version.
"
end
