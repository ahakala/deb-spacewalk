class deb-spacewalk {
	file { '/etc/apt/apt.conf':
	ensure => 'present',
	source => 'puppet:///modules/deb-spacewalk/apt.conf',
	}
	package { 'rhnsd':
	ensure => 'present',
	}
	package { 'apt-transport-spacewalk':
	ensure => 'present',
	}
	file { '/usr/lib/python2.7/xmlrpclib.py':
	ensure => 'present',
	source => 'puppet:///modules/deb-spacewalk/xmlrpclib.py'
	}
	package { 'python-libxml2':
	ensure => 'present',
	}
	file { '/var/lock/subsys':
	ensure => 'directory',
	}
	exec { 'setup spacewalk' :
	creates => '/etc/sysconfig/rhn/systemid',
	command => '/usr/sbin/rhnreg_ks --activationkey=1-trusty --serverUrl=http://spacewalk.tiesrad.net/XMLRPC',
	#unless => '/usr/bin/test -f /etc/sysconfig/rhn/systemid',
	}
}


