control "M-1.13" do
  title "1.13 Ensure auditing is configured for Docker files and directories
/usr/bin/docker-runc (Scored)"
  desc  "
    Audit /usr/bin/docker-runc, if applicable.
    Apart from auditing your regular Linux file system and system calls, audit
all Docker
    related files and directories. Docker daemon runs with root privileges. Its
behavior
    depends on some key files and directories. /usr/bin/docker-runc is one such
file. Docker
    now relies on containerd and runC to spawn containers. It must be audited,
if applicable.

  "
  impact 0.5
  tag "ref": "1.
https://access.redhat.com/documentation/enUS/Red_Hat_Enterprise_Linux/6/html/Security_Guide/chap-system_auditing.html\n2.
https://github.com/docker/docker/pull/20662\n3. https://containerd.tools/\n4.
https://github.com/opencontainers/runc\n"
  tag "severity": "medium"
  tag "cis_id": "1.13"
  tag "cis_control": "14.6 Enforce Detailed Audit Logging For Sensitive
Information\n"
  tag "cis_level": "Level 1 - Linux Host OS"
  tag "nist": ["AU-2"]
  tag "audit": "Verify that there is an audit rule corresponding to
/usr/bin/docker-runc file.\nFor example, execute below command:\nauditctl -l |
grep /usr/bin/docker-runc\nThis should list a rule for /usr/bin/docker-runc
file.\n"
  tag "fix": "Add a rule for /usr/bin/docker-runc file.\nFor example,\nAdd the
line as below in /etc/audit/audit.rules file:\n-w /usr/bin/docker-runc -k
docker\nThen, restart the audit daemon. For example,\nservice auditd restart\n"
  tag "Default Value": "By default, Docker related files and directories are
not audited. The file/usr/bin/dockerrunc may not be available on the system. In
that case, this recommendation is not\napplicable.\n"
end
