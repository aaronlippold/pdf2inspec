control "M-1.7" do
  title "1.7 Ensure auditing is configured for Docker files and directories
/etc/docker (Scored)"
  desc  "
    Audit /etc/docker.
    Apart from auditing your regular Linux file system and system calls, audit
all Docker
    related files and directories. Docker daemon runs with root privileges. Its
behavior
    depends on some key files and directories. /etc/docker is one such
directory. It holds
    various certificates and keys used for TLS communication between Docker
daemon and
    Docker client. It must be audited.

  "
  impact 0.5
  tag "ref": "1.
https://access.redhat.com/documentation/enUS/Red_Hat_Enterprise_Linux/6/html/Security_Guide/chap-system_auditing.html\n"
  tag "severity": "medium"
  tag "cis_id": "1.7"
  tag "cis_control": "14.6 Enforce Detailed Audit Logging For Sensitive
Information\n"
  tag "cis_level": "Level 1 - Linux Host OS"
  tag "nist": ["AU-2"]
  tag "audit": "Verify that there is an audit rule corresponding to /etc/docker
directory.\nFor example, execute below command:\nauditctl -l | grep
/etc/docker\nThis should list a rule for /etc/docker directory.\n"
  tag "fix": "Add a rule for /etc/docker directory.\nFor example,\nAdd the line
as below in /etc/audit/audit.rules file:\n-w /etc/docker -k docker\nThen,
restart the audit daemon. For example,\nservice auditd restart\n"
  tag "Default Value": "By default, Docker related files and directories are
not audited.\n"
end
