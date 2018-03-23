control "M-1.5" do
  title "1.5 Disable Interactive Login (Scored)"
  desc  "When created, the MySQL user may have interactive access to the
operating system, which means that the MySQL user could login to the host as
any other user would. Preventing the MySQL user from logging in interactively
may reduce the impact of a compromised MySQL account.  There is also more
accountability as accessing the operating  system where the MySQL server lies
will require the user's own account.  Interactive access by the MySQL user is
unnecessary and should be disabled. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "1.5"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 2
  tag "audit text": "Execute the following command to assess this
recommendation
getent passwd mysql | egrep '^.*[\\/bin\\/false|\\/sbin\\/nologin]$'
Lack of output implies a finding.
"
  tag "fix": "Perform the following steps to remediate this setting: Execute
one of the following commands in a terminal
usermod -s /bin/false
usermod -s /sbin/nologin "
end
