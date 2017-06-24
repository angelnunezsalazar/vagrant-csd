#https://github.com/ghoneycutt/puppet-svn

class subversion{
	Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
	
	$repositories_path = "/srv/svn/"
	$default_repository_name="csd"
	$default_user_name_password="vagrant"
	
	class { "apache": }

	apache::mod { 'dav_svn':}
	
	package {"subversion":
		ensure => present
	}
	
	group { "subversion":
		ensure => present
  	}
	
	exec {"add vagrant to subversion":
		unless => "grep -q 'subversion\\S*vagrant' /etc/group",
		command => "usermod -aG subversion vagrant",
		require => Group["subversion"]
	}
	
	file { $repositories_path:
		ensure 	=> directory,
		owner		=> "www-data",
		group 	=> "subversion",
		mode   	=> 2660,
		require => [Group["subversion"],Class["apache"]]
	}
	
	file { "/etc/apache2/mods-enabled/dav_svn.conf":
		content => template("subversion/dav_svn.conf.erb"),
		notify => Service["apache2"],
	}
	
	package {"apache2-utils":
		ensure => present
	}

	exec { 'add default user':
	  command     => "htpasswd -c -b /etc/apache2/dav_svn.passwd ${default_user_name_password} ${default_user_name_password}",
		require => [Class["apache"], Package["apache2-utils"]]
	}

	exec { 'create default repository':
	  command => "svnadmin create ${repositories_path}/${default_repository_name}",
		require => [Package["subversion"], File[$repositories_path]]
	}
	
	file { "${repositories_path}/${default_repository_name}":
		ensure 	=> directory,
		owner		=> "www-data",
		group 	=> "subversion",
		mode   	=> 2660,
		recurse => true,
		require => Exec["create default repository"]
	}
}