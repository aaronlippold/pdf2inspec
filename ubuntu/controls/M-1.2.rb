control "M-1.2" do
  title "1.2 Ensure the container host has been Hardened (Not Scored)"
  desc  "
    Containers run on a Linux host. A container host can run one or more
containers. It is of
    utmost importance to harden the host to mitigate host security
misconfiguration.
    You should follow infrastructure security best practices and harden your
host OS. Keeping
    the host system hardened would ensure that the host vulnerabilities are
mitigated. Not
    hardening the host system could lead to security exposures and breaches.

  "
  impact 0.5
  tag "ref": "1.
https://docs.docker.com/engine/security/security/\n2.\n3.\n4.\n5.\n6.\n7.\nhttps://learn.cisecurity.org/benchmarks\nhttps://docs.docker.com/engine/security/security/#other-kernel-security-features\nhttps://grsecurity.net/\nhttps://en.wikibooks.org/wiki/Grsecurity\nhttps://pax.grsecurity.net/\nhttp://en.wikipedia.org/wiki/PaX\n"
  tag "severity": "medium"
  tag "cis_id": "1.2"
  tag "cis_control": "3 Secure Configurations for Hardware and Software on
Mobile Devices, Laptops,\n"
  tag "cis_level": "Level 1 - Linux Host OS"
  tag "nist": ["CM-6"]
  tag "audit": "Ensure that the host specific security guidelines are followed.
Ask the system\nadministrators which security benchmark does current host
system comply with. Ensure\nthat the host systems actually comply with that
host specific security benchmark.\n"
  tag "fix": "You may consider various CIS Security Benchmarks for your
container host. If you have\nother security guidelines or regulatory
requirements to adhere to, please follow them as\nsuitable in your
environment.\nAdditionally, you can run a kernel with grsecurity and PaX. This
would add many safety\nchecks, both at compile-time and run-time. It is also
designed to defeat many exploits and\nhas powerful security features. These
features do not require Docker-specific\nconfiguration, since those security
features apply system-wide, independent of containers.\n"
  tag "Default Value": "By default, host has factory settings. It is not
hardened.\n"
end
