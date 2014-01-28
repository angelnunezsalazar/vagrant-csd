class desktop::app($apps){
	
	define install_app {
		package { "${name}":
			ensure => present
		}
	}
	
	install_app { $apps : }
}