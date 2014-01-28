class rvm_ruby{
	Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
	
	exec {"install rvm":
		command => "su -c 'curl -L https://get.rvm.io | bash -s stable' - vagrant",
	}
	->
	exec {"source rvm":
		command => "su -c 'source ~/.rvm/scripts/rvm' - vagrant",
	}	
	->
	exec {"rvm to bash":
		command => "su -c 'echo \"source ~/.rvm/scripts/rvm\" >> ~/.bashrc' - vagrant",
	}
}