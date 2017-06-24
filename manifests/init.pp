

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

