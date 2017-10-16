control "M-1.5" do
  title "1.5 Ensure auditing is configured for the docker daemon (Scored)"
  desc  "
    Audit all Docker daemon activities.
    Apart from auditing your regular Linux file system and system calls, audit
Docker daemon
    as well. Docker daemon runs with root privileges. It is thus necessary to
audit its activities
    and usage.

  "
  impact 0.5
  tag "ref": "1.
https://access.redhat.com/documentation/enUS/Red_Hat_Enterprise_Linux/6/html/Security_Guide/chap-system_auditing.html\n"
  tag "severity": "medium"
  tag "cis_id": "1.5"
  tag "cis_control": "6.2 Ensure Audit Log Settings Support Appropriate Log
Entry Formatting\n"
  tag "cis_level": "Level 1 - Linux Host OS"
  tag "nist": ["AU-3"]
  tag "audit": "Verify that there is an audit rule for Docker daemon. For
example, execute below\ncommand:\nauditctl -l | grep /usr/bin/docker\nThis
should list a rule for Docker daemon.\n"
  tag "fix": "Add a rule for Docker daemon.\nFor example,\nAdd the line as
below line in /etc/audit/audit.rules file:\n-w /usr/bin/docker -k docker\nThen,
restart the audit daemon. For example,\nservice auditd restart\n"
  tag "Default Value": "By default, Docker daemon is not audited.\n"
end
