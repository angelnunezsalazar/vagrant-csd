stage { "pre":
  before => Stage["main"],
}

class upgrade_system{
	exec {"apt-get update && apt-get -y upgrade":
		path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
	}
}

class { "upgrade_system":
	stage => pre
}

class { "jenkins":}

class { "subversion":}

class { "desktop":}
->
class { "desktop::app": 
	apps => ["firefox","gedit","rapidsvn"]
}

class { "rvm": }
->
class { "rvm::ruby": 
	version => "1.9.3"
}
->
class{ "rvm::gem":
	gems => ["rspec","cucumber","sinatra"]
}

