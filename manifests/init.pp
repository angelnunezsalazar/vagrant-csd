stage { "pre":
  before => Stage["main"],
}

exec {"update_upgrade":
	command => "apt-get update && apt-get -y upgrade",
	path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
	stage => pre
}

class { "desktop":}