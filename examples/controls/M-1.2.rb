control "M-1.2" do
  title "Ensure the container host has been Hardened (Not Scored)"
  desc  "
    Description:
    Containers run on a Linux host. A container host can run one or more
containers. It is of utmost importance to harden the host to mitigate host
security misconfiguration.
    Rationale:
    You should follow infrastructure security best practices and harden your
host OS. Keeping the host system hardened would ensure that the host
vulnerabilities are mitigated. Not hardening the host system could lead to
security exposures and breaches.
  "
  impact 1
  tag "ref": ["1. https://docs.docker.com/engine/security/security/", "2.
https://learn.cisecurity.org/benchmarks", "3.
https://docs.docker.com/engine/security/security/#other-kernel-security-features",
"4. https://grsecurity.net/", "5. https://en.wikibooks.org/wiki/Grsecurity",
"6. https://pax.grsecurity.net/", "7. http://en.wikipedia.org/wiki/PaX"]
  tag "applicability": "Linux Host OS"
  tag "cis_id": "1.2"
  tag "cis_control": ["3"]
  tag "cis_level": 1
  tag "check": "Audit:\nEnsure that the host specific security guidelines are
followed. Ask the system administrators which security benchmark does current
host system comply with. Ensure that the host systems actually comply with that
host specific security benchmark."
  tag "fix": "Remediation:\nYou may consider various CIS Security Benchmarks
for your container host. If you have other security guidelines or regulatory
requirements to adhere to, please follow them as suitable in your
environment.\nAdditionally, you can run a kernel with grsecurity and PaX. This
would add many safety checks, both at compile-time and run-time. It is also
designed to defeat many exploits and has powerful security features. These
features do not require Docker-specific configuration, since those security
features apply system-wide, independent of containers.\nImpact:\nNone.\nDefault
Value:\nBy default, host has factory settings. It is not hardened."
end
