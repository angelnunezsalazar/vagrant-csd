class rvm::gem($gems){
	
	define install_gem {
		exec {"su -c 'gem install ${name}' - vagrant":
			path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
			timeout => 600 #10min
		}
	}
	
	install_gem { $gems : }
}