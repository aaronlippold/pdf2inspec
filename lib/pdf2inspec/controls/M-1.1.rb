control "M-1.1" do
  title "Ensure a separate partition for containers has been created (Scored)"
  desc  "
    Description:
                      All Docker containers and their data and metadata is
stored under /var/lib/docker directory. By default, /var/lib/docker would be
mounted under / or /var partitions based on availability.
                      Rationale:
                      Docker depends on /var/lib/docker as the default
directory where all Docker related files, including the images, are stored.
This directory might fill up fast and soon Docker and the host could become
unusable. So, it is advisable to create a separate partition (logical volume)
for storing Docker files.
  "
  impact 1
  tag "ref":
["https://www.projectatomic.io/docs/docker-storage-recommendation/"]
  tag "applicability": "Linux Host OS"
  tag "cis_id": "1.1"
  tag "cis_control": ["14"]
  tag "cis_level": 1
  tag "check": "At the Docker host execute the below command: grep
/var/lib/docker /etc/fstab\n                  This should return the partition
details for /var/lib/docker mount point."
  tag "fix": "For new installations, create a separate partition for
/var/lib/docker mount point. For systems that were previously installed, use
the Logical Volume Manager (LVM) to create partitions.\n
Impact:\n                  None.\n                  Default Value:\n
      By default, /var/lib/docker would be mounted under / or /var partitions
based on availability."
end
