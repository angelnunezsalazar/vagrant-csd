class desktop{
	package { "xfce4":
    ensure => present
  }
	->
	exec {"chown vagrant:vagrant /home/vagrant/.ICEauthority":
		path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ]
	}	
}