stage { "pre":
  before => Stage["main"],
}

exec {"update_upgrade":
	command => "apt-get update && apt-get -y upgrade",
	path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
	stage => pre
}

class { "jenkins":}

class { "subversion":}

class { "rvm": }
->
class { "rvm::ruby": 
	version => "1.9.3"
}
->
class{ "rvm::gem":
	gems => ["rspec","cucumber","sinatra"]
}

exec {"update_upgrade":
	command => "apt-get update && apt-get -y upgrade",
	path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ]
}