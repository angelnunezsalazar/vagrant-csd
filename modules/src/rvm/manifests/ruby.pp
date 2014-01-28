class rvm::ruby($version = "1.9.3"){
	Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

	exec {"rvm requirements":
		command => "su -c 'rvm requirements' - vagrant",
	}	
	->
	exec {"install ruby":
		command => "su -c 'rvm install ${version}' - vagrant",
		timeout => 5400 #90min
	}
	->
	exec {"default ruby":
		command => "su -c 'rvm --default use ${version}' - vagrant",
	}
}