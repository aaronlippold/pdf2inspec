control "M-2.5" do
  title "2.5 Do Not Use Default or Non-MySQL-specific Cryptographic Keys (Not
Scored)"
  desc  "The SSL certificate and key used by MySQL should be used only for
MySQL and only for one instance. Use of default certificates can allow an
attacker to impersonate the MySQL server. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "2.5"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 2
  tag "audit text": "Check if the certificate is bound to one instance of
MySQL.
"
  tag "fix": "Generate a new certificate/key per MySQL instance.
"
end
