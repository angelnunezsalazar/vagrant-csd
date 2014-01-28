class rvm::ruby($version = "1.9.3"){
	Exec { 
		path 		=> [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
		timeout => 0	
	}

	exec {"rvm requirements":
		command => "su -c 'rvm requirements' - vagrant",
	}	
	->
	exec {"install ruby":
		command => "su -c 'rvm install ${version}' - vagrant",
	}
	->
	exec {"default ruby":
		command => "su -c 'rvm --default use ${version}' - vagrant",
	}
}