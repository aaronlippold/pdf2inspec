require_relative "../../../lib/pdf2inspec/text_cleaner"
require 'rspec'

RSpec.describe TextCleaner do
  isolated_data_input = 'CIS Docker Community Edition Benchmark
v1.1.0 - 07-06-2017

1|Page

Table of Contents
Overview .................................................................................................................................................................. 8
Intended Audience ........................................................................................................................................... 8
Consensus Guidance........................................................................................................................................ 8
Typographical Conventions ......................................................................................................................... 9
Scoring Information ........................................................................................................................................ 9
Profile Definitions ......................................................................................................................................... 10
Acknowledgements ...................................................................................................................................... 11
Recommendations ............................................................................................................................................. 12
1 Host Configuration .................................................................................................................................... 12
1.1 Ensure a separate partition for containers has been created (Scored) .................. 12
1.2 Ensure the container host has been Hardened (Not Scored) ...................................... 14
1.3 Ensure Docker is up to date (Not Scored) .......................................................................... 16
1.4 Ensure only trusted users are allowed to control Docker daemon (Scored) ........ 18
1.5 Ensure auditing is configured for the docker daemon (Scored) ................................ 20
1.6 Ensure auditing is configured for Docker files and directories - /var/lib/docker
(Scored) ................................................................................................................................................... 22
1.7 Ensure auditing is configured for Docker files and directories - /etc/docker
(Scored) ................................................................................................................................................... 24
1.8 Ensure auditing is configured for Docker files and directories - docker.service
(Scored) ................................................................................................................................................... 26
1.9 Ensure auditing is configured for Docker files and directories - docker.socket
(Scored) ................................................................................................................................................... 28
1.10 Ensure auditing is configured for Docker files and directories /etc/default/docker (Scored) ......................................................................................................... 30
1.11 Ensure auditing is configured for Docker files and directories /etc/docker/daemon.json (Scored) ............................................................................................. 32
1.12 Ensure auditing is configured for Docker files and directories /usr/bin/docker-containerd (Scored) ........................................................................................ 34

1.1 Ensure a separate partition for containers has been created (Scored)
Profile Applicability:
Level 1 - Linux Host OS
Description:
All Docker containers and their data and metadata is stored under /var/lib/docker
directory. By default, /var/lib/docker would be mounted under / or /var partitions based
on availability.
Rationale:
Docker depends on /var/lib/docker as the default directory where all Docker related files,
including the images, are stored. This directory might fill up fast and soon Docker and the
host could become unusable. So, it is advisable to create a separate partition (logical
volume) for storing Docker files.
Audit:
At the Docker host execute the below command:
grep /var/lib/docker /etc/fstab

This should return the partition details for /var/lib/docker mount point.
Remediation:
For new installations, create a separate partition for /var/lib/docker mount point. For
systems that were previously installed, use the Logical Volume Manager (LVM) to create
partitions.

12 | P a g e

Impact:
None.
Default Value:
By default, /var/lib/docker would be mounted under / or /var partitions based on
availability.
References:
1. https://www.projectatomic.io/docs/docker-storage-recommendation/
CIS Controls:
14 Controlled Access Based on the Need to Know
Controlled Access Based on the Need to Know

13 | P a g e

1.2 Ensure the container host has been Hardened (Not Scored)
Profile Applicability:
Level 1 - Linux Host OS
Description:
Containers run on a Linux host. A container host can run one or more containers. It is of
utmost importance to harden the host to mitigate host security misconfiguration.
Rationale:
You should follow infrastructure security best practices and harden your host OS. Keeping
the host system hardened would ensure that the host vulnerabilities are mitigated. Not
hardening the host system could lead to security exposures and breaches.
Audit:
Ensure that the host specific security guidelines are followed. Ask the system
administrators which security benchmark does current host system comply with. Ensure
that the host systems actually comply with that host specific security benchmark.
Remediation:
You may consider various CIS Security Benchmarks for your container host. If you have
other security guidelines or regulatory requirements to adhere to, please follow them as
suitable in your environment.
Additionally, you can run a kernel with grsecurity and PaX. This would add many safety
checks, both at compile-time and run-time. It is also designed to defeat many exploits and
has powerful security features. These features do not require Docker-specific
configuration, since those security features apply system-wide, independent of containers.
Impact:
None.
Default Value:
By default, host has factory settings. It is not hardened.
References:
1. https://docs.docker.com/engine/security/security/
14 | P a g e

2.
3.
4.
5.
6.
7.

https://learn.cisecurity.org/benchmarks
https://docs.docker.com/engine/security/security/#other-kernel-security-features
https://grsecurity.net/
https://en.wikibooks.org/wiki/Grsecurity
https://pax.grsecurity.net/
http://en.wikipedia.org/wiki/PaX

CIS Controls:
3 Secure Configurations for Hardware and Software on Mobile Devices, Laptops,
Workstations, and Servers
Secure Configurations for Hardware and Software on Mobile Devices, Laptops,
Workstations, and Servers

222 | P a g e

Appendix: Summary Table
Control'
  isolated_data_output = '1.1 Ensure a separate partition for containers has been created (Scored)
Profile Applicability:
Level 1 - Linux Host OS
Description:
All Docker containers and their data and metadata is stored under /var/lib/docker
directory. By default, /var/lib/docker would be mounted under / or /var partitions based
on availability.
Rationale:
Docker depends on /var/lib/docker as the default directory where all Docker related files,
including the images, are stored. This directory might fill up fast and soon Docker and the
host could become unusable. So, it is advisable to create a separate partition (logical
volume) for storing Docker files.
Audit:
At the Docker host execute the below command:
grep /var/lib/docker /etc/fstab

This should return the partition details for /var/lib/docker mount point.
Remediation:
For new installations, create a separate partition for /var/lib/docker mount point. For
systems that were previously installed, use the Logical Volume Manager (LVM) to create
partitions.

12 | P a g e

Impact:
None.
Default Value:
By default, /var/lib/docker would be mounted under / or /var partitions based on
availability.
References:
1. https://www.projectatomic.io/docs/docker-storage-recommendation/
CIS Controls:
14 Controlled Access Based on the Need to Know
Controlled Access Based on the Need to Know

13 | P a g e

1.2 Ensure the container host has been Hardened (Not Scored)
Profile Applicability:
Level 1 - Linux Host OS
Description:
Containers run on a Linux host. A container host can run one or more containers. It is of
utmost importance to harden the host to mitigate host security misconfiguration.
Rationale:
You should follow infrastructure security best practices and harden your host OS. Keeping
the host system hardened would ensure that the host vulnerabilities are mitigated. Not
hardening the host system could lead to security exposures and breaches.
Audit:
Ensure that the host specific security guidelines are followed. Ask the system
administrators which security benchmark does current host system comply with. Ensure
that the host systems actually comply with that host specific security benchmark.
Remediation:
You may consider various CIS Security Benchmarks for your container host. If you have
other security guidelines or regulatory requirements to adhere to, please follow them as
suitable in your environment.
Additionally, you can run a kernel with grsecurity and PaX. This would add many safety
checks, both at compile-time and run-time. It is also designed to defeat many exploits and
has powerful security features. These features do not require Docker-specific
configuration, since those security features apply system-wide, independent of containers.
Impact:
None.
Default Value:
By default, host has factory settings. It is not hardened.
References:
1. https://docs.docker.com/engine/security/security/
14 | P a g e

2.
3.
4.
5.
6.
7.

https://learn.cisecurity.org/benchmarks
https://docs.docker.com/engine/security/security/#other-kernel-security-features
https://grsecurity.net/
https://en.wikibooks.org/wiki/Grsecurity
https://pax.grsecurity.net/
http://en.wikipedia.org/wiki/PaX

CIS Controls:
3 Secure Configurations for Hardware and Software on Mobile Devices, Laptops,
Workstations, and Servers
Secure Configurations for Hardware and Software on Mobile Devices, Laptops,
Workstations, and Servers

222 | P a g e

'
  remove_pagenum_output = '1.1 Ensure a separate partition for containers has been created (Scored)
Profile Applicability:
Level 1 - Linux Host OS
Description:
All Docker containers and their data and metadata is stored under /var/lib/docker
directory. By default, /var/lib/docker would be mounted under / or /var partitions based
on availability.
Rationale:
Docker depends on /var/lib/docker as the default directory where all Docker related files,
including the images, are stored. This directory might fill up fast and soon Docker and the
host could become unusable. So, it is advisable to create a separate partition (logical
volume) for storing Docker files.
Audit:
At the Docker host execute the below command:
grep /var/lib/docker /etc/fstab

This should return the partition details for /var/lib/docker mount point.
Remediation:
For new installations, create a separate partition for /var/lib/docker mount point. For
systems that were previously installed, use the Logical Volume Manager (LVM) to create
partitions.



Impact:
None.
Default Value:
By default, /var/lib/docker would be mounted under / or /var partitions based on
availability.
References:
1. https://www.projectatomic.io/docs/docker-storage-recommendation/
CIS Controls:
14 Controlled Access Based on the Need to Know
Controlled Access Based on the Need to Know



1.2 Ensure the container host has been Hardened (Not Scored)
Profile Applicability:
Level 1 - Linux Host OS
Description:
Containers run on a Linux host. A container host can run one or more containers. It is of
utmost importance to harden the host to mitigate host security misconfiguration.
Rationale:
You should follow infrastructure security best practices and harden your host OS. Keeping
the host system hardened would ensure that the host vulnerabilities are mitigated. Not
hardening the host system could lead to security exposures and breaches.
Audit:
Ensure that the host specific security guidelines are followed. Ask the system
administrators which security benchmark does current host system comply with. Ensure
that the host systems actually comply with that host specific security benchmark.
Remediation:
You may consider various CIS Security Benchmarks for your container host. If you have
other security guidelines or regulatory requirements to adhere to, please follow them as
suitable in your environment.
Additionally, you can run a kernel with grsecurity and PaX. This would add many safety
checks, both at compile-time and run-time. It is also designed to defeat many exploits and
has powerful security features. These features do not require Docker-specific
configuration, since those security features apply system-wide, independent of containers.
Impact:
None.
Default Value:
By default, host has factory settings. It is not hardened.
References:
1. https://docs.docker.com/engine/security/security/


2.
3.
4.
5.
6.
7.

https://learn.cisecurity.org/benchmarks
https://docs.docker.com/engine/security/security/#other-kernel-security-features
https://grsecurity.net/
https://en.wikibooks.org/wiki/Grsecurity
https://pax.grsecurity.net/
http://en.wikipedia.org/wiki/PaX

CIS Controls:
3 Secure Configurations for Hardware and Software on Mobile Devices, Laptops,
Workstations, and Servers
Secure Configurations for Hardware and Software on Mobile Devices, Laptops,
Workstations, and Servers



'
  remove_section_header_output = '1.1 Ensure a separate partition for containers has been created (Scored)
Profile Applicability:
Level 1 - Linux Host OS
Description:
All Docker containers and their data and metadata is stored under /var/lib/docker
directory. By default, /var/lib/docker would be mounted under / or /var partitions based
on availability.
Rationale:
Docker depends on /var/lib/docker as the default directory where all Docker related files,
including the images, are stored. This directory might fill up fast and soon Docker and the
host could become unusable. So, it is advisable to create a separate partition (logical
volume) for storing Docker files.
Audit:
At the Docker host execute the below command:
grep /var/lib/docker /etc/fstab

This should return the partition details for /var/lib/docker mount point.
Remediation:
For new installations, create a separate partition for /var/lib/docker mount point. For
systems that were previously installed, use the Logical Volume Manager (LVM) to create
partitions.



Impact:
None.
Default Value:
By default, /var/lib/docker would be mounted under / or /var partitions based on
availability.
References:
1. https://www.projectatomic.io/docs/docker-storage-recommendation/
CIS Controls:
14 Controlled Access Based on the Need to Know
Controlled Access Based on the Need to Know



1.2 Ensure the container host has been Hardened (Not Scored)
Profile Applicability:
Level 1 - Linux Host OS
Description:
Containers run on a Linux host. A container host can run one or more containers. It is of
utmost importance to harden the host to mitigate host security misconfiguration.
Rationale:
You should follow infrastructure security best practices and harden your host OS. Keeping
the host system hardened would ensure that the host vulnerabilities are mitigated. Not
hardening the host system could lead to security exposures and breaches.
Audit:
Ensure that the host specific security guidelines are followed. Ask the system
administrators which security benchmark does current host system comply with. Ensure
that the host systems actually comply with that host specific security benchmark.
Remediation:
You may consider various CIS Security Benchmarks for your container host. If you have
other security guidelines or regulatory requirements to adhere to, please follow them as
suitable in your environment.
Additionally, you can run a kernel with grsecurity and PaX. This would add many safety
checks, both at compile-time and run-time. It is also designed to defeat many exploits and
has powerful security features. These features do not require Docker-specific
configuration, since those security features apply system-wide, independent of containers.
Impact:
None.
Default Value:
By default, host has factory settings. It is not hardened.
References:
1. https://docs.docker.com/engine/security/security/


2.
3.
4.
5.
6.
7.

https://learn.cisecurity.org/benchmarks
https://docs.docker.com/engine/security/security/#other-kernel-security-features
https://grsecurity.net/
https://en.wikibooks.org/wiki/Grsecurity
https://pax.grsecurity.net/
http://en.wikipedia.org/wiki/PaX

CIS Controls:
3 Secure Configurations for Hardware and Software on Mobile Devices, Laptops,
Workstations, and Servers
Secure Configurations for Hardware and Software on Mobile Devices, Laptops,
Workstations, and Servers



'
  remove_newline_in_controls_output = '1.1 Ensure a separate partition for containers has been created (Scored)
Profile Applicability:
Level 1 - Linux Host OS
Description:
All Docker containers and their data and metadata is stored under /var/lib/docker
directory. By default, /var/lib/docker would be mounted under / or /var partitions based
on availability.
Rationale:
Docker depends on /var/lib/docker as the default directory where all Docker related files,
including the images, are stored. This directory might fill up fast and soon Docker and the
host could become unusable. So, it is advisable to create a separate partition (logical
volume) for storing Docker files.
Audit:
At the Docker host execute the below command:
grep /var/lib/docker /etc/fstab
This should return the partition details for /var/lib/docker mount point.
Remediation:
For new installations, create a separate partition for /var/lib/docker mount point. For
systems that were previously installed, use the Logical Volume Manager (LVM) to create
partitions.

Impact:
None.
Default Value:
By default, /var/lib/docker would be mounted under / or /var partitions based on
availability.
References:
1. https://www.projectatomic.io/docs/docker-storage-recommendation/
CIS Controls:
14 Controlled Access Based on the Need to Know
Controlled Access Based on the Need to Know

1.2 Ensure the container host has been Hardened (Not Scored)
Profile Applicability:
Level 1 - Linux Host OS
Description:
Containers run on a Linux host. A container host can run one or more containers. It is of
utmost importance to harden the host to mitigate host security misconfiguration.
Rationale:
You should follow infrastructure security best practices and harden your host OS. Keeping
the host system hardened would ensure that the host vulnerabilities are mitigated. Not
hardening the host system could lead to security exposures and breaches.
Audit:
Ensure that the host specific security guidelines are followed. Ask the system
administrators which security benchmark does current host system comply with. Ensure
that the host systems actually comply with that host specific security benchmark.
Remediation:
You may consider various CIS Security Benchmarks for your container host. If you have
other security guidelines or regulatory requirements to adhere to, please follow them as
suitable in your environment.
Additionally, you can run a kernel with grsecurity and PaX. This would add many safety
checks, both at compile-time and run-time. It is also designed to defeat many exploits and
has powerful security features. These features do not require Docker-specific
configuration, since those security features apply system-wide, independent of containers.
Impact:
None.
Default Value:
By default, host has factory settings. It is not hardened.
References:
1. https://docs.docker.com/engine/security/security/

2.
3.
4.
5.
6.
7.
https://learn.cisecurity.org/benchmarks
https://docs.docker.com/engine/security/security/#other-kernel-security-features
https://grsecurity.net/
https://en.wikibooks.org/wiki/Grsecurity
https://pax.grsecurity.net/
http://en.wikipedia.org/wiki/PaX
CIS Controls:
3 Secure Configurations for Hardware and Software on Mobile Devices, Laptops,
Workstations, and Servers
Secure Configurations for Hardware and Software on Mobile Devices, Laptops,
Workstations, and Servers

'
  remove_special_output = '1.1 Ensure a separate partition for containers has been created (Scored)
Profile Applicability:
Level 1 - Linux Host OS
Description:
All Docker containers and their data and metadata is stored under /var/lib/docker
directory. By default, /var/lib/docker would be mounted under / or /var partitions based
on availability.
Rationale:
Docker depends on /var/lib/docker as the default directory where all Docker related files,
including the images, are stored. This directory might fill up fast and soon Docker and the
host could become unusable. So, it is advisable to create a separate partition (logical
volume) for storing Docker files.
Audit:
At the Docker host execute the below command:
grep /var/lib/docker /etc/fstab
This should return the partition details for /var/lib/docker mount point.
Remediation:
For new installations, create a separate partition for /var/lib/docker mount point. For
systems that were previously installed, use the Logical Volume Manager (LVM) to create
partitions.

Impact:
None.
Default Value:
By default, /var/lib/docker would be mounted under / or /var partitions based on
availability.
References:
1. https://www.projectatomic.io/docs/docker-storage-recommendation/
CIS Controls:
14 Controlled Access Based on the Need to Know
Controlled Access Based on the Need to Know

1.2 Ensure the container host has been Hardened (Not Scored)
Profile Applicability:
Level 1 - Linux Host OS
Description:
Containers run on a Linux host. A container host can run one or more containers. It is of
utmost importance to harden the host to mitigate host security misconfiguration.
Rationale:
You should follow infrastructure security best practices and harden your host OS. Keeping
the host system hardened would ensure that the host vulnerabilities are mitigated. Not
hardening the host system could lead to security exposures and breaches.
Audit:
Ensure that the host specific security guidelines are followed. Ask the system
administrators which security benchmark does current host system comply with. Ensure
that the host systems actually comply with that host specific security benchmark.
Remediation:
You may consider various CIS Security Benchmarks for your container host. If you have
other security guidelines or regulatory requirements to adhere to, please follow them as
suitable in your environment.
Additionally, you can run a kernel with grsecurity and PaX. This would add many safety
checks, both at compile-time and run-time. It is also designed to defeat many exploits and
has powerful security features. These features do not require Docker-specific
configuration, since those security features apply system-wide, independent of containers.
Impact:
None.
Default Value:
By default, host has factory settings. It is not hardened.
References:
1. https://docs.docker.com/engine/security/security/

2.
3.
4.
5.
6.
7.
https://learn.cisecurity.org/benchmarks
https://docs.docker.com/engine/security/security/#other-kernel-security-features
https://grsecurity.net/
https://en.wikibooks.org/wiki/Grsecurity
https://pax.grsecurity.net/
http://en.wikipedia.org/wiki/PaX
CIS Controls:
3 Secure Configurations for Hardware and Software on Mobile Devices, Laptops,
Workstations, and Servers
Secure Configurations for Hardware and Software on Mobile Devices, Laptops,
Workstations, and Servers

'
  separate_controls_output = '
1.1 Ensure a separate partition for containers has been created (Scored)
Profile Applicability:
Level 1 - Linux Host OS
Description:
All Docker containers and their data and metadata is stored under /var/lib/docker
directory. By default, /var/lib/docker would be mounted under / or /var partitions based
on availability.
Rationale:
Docker depends on /var/lib/docker as the default directory where all Docker related files,
including the images, are stored. This directory might fill up fast and soon Docker and the
host could become unusable. So, it is advisable to create a separate partition (logical
volume) for storing Docker files.
Audit:
At the Docker host execute the below command:
grep /var/lib/docker /etc/fstab
This should return the partition details for /var/lib/docker mount point.
Remediation:
For new installations, create a separate partition for /var/lib/docker mount point. For
systems that were previously installed, use the Logical Volume Manager (LVM) to create
partitions.

Impact:
None.
Default Value:
By default, /var/lib/docker would be mounted under / or /var partitions based on
availability.
References:
1. https://www.projectatomic.io/docs/docker-storage-recommendation/
CIS Controls:
14 Controlled Access Based on the Need to Know
Controlled Access Based on the Need to Know



1.2 Ensure the container host has been Hardened (Not Scored)
Profile Applicability:
Level 1 - Linux Host OS
Description:
Containers run on a Linux host. A container host can run one or more containers. It is of
utmost importance to harden the host to mitigate host security misconfiguration.
Rationale:
You should follow infrastructure security best practices and harden your host OS. Keeping
the host system hardened would ensure that the host vulnerabilities are mitigated. Not
hardening the host system could lead to security exposures and breaches.
Audit:
Ensure that the host specific security guidelines are followed. Ask the system
administrators which security benchmark does current host system comply with. Ensure
that the host systems actually comply with that host specific security benchmark.
Remediation:
You may consider various CIS Security Benchmarks for your container host. If you have
other security guidelines or regulatory requirements to adhere to, please follow them as
suitable in your environment.
Additionally, you can run a kernel with grsecurity and PaX. This would add many safety
checks, both at compile-time and run-time. It is also designed to defeat many exploits and
has powerful security features. These features do not require Docker-specific
configuration, since those security features apply system-wide, independent of containers.
Impact:
None.
Default Value:
By default, host has factory settings. It is not hardened.
References:
1. https://docs.docker.com/engine/security/security/

2.
3.
4.
5.
6.
7.
https://learn.cisecurity.org/benchmarks
https://docs.docker.com/engine/security/security/#other-kernel-security-features
https://grsecurity.net/
https://en.wikibooks.org/wiki/Grsecurity
https://pax.grsecurity.net/
http://en.wikipedia.org/wiki/PaX
CIS Controls:
3 Secure Configurations for Hardware and Software on Mobile Devices, Laptops,
Workstations, and Servers
Secure Configurations for Hardware and Software on Mobile Devices, Laptops,
Workstations, and Servers

'
  text_cleaner = TextCleaner.new
  # puts TextCleaner.new.isolate_controls_data(input)
  it "should be equal" do
    text_cleaner.isolate_controls_data(isolated_data_input).should == isolated_data_output
  end
  it "should be equal" do
    text_cleaner.remove_pagenum(isolated_data_output).should == remove_pagenum_output
  end
  it "should be equal" do
    text_cleaner.remove_section_header(remove_pagenum_output).should == remove_section_header_output
  end
  it "should be equal" do
    text_cleaner.remove_newline_in_controls(remove_section_header_output).should == remove_newline_in_controls_output
  end
  it "should be equal" do
    text_cleaner.remove_special(remove_newline_in_controls_output).should == remove_special_output
  end
  it "should be equal" do
    text_cleaner.separate_controls(remove_special_output).should == separate_controls_output
  end
end