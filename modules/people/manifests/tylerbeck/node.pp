class people::tylerbeck::node {
  $node_version = hiera('default_node_version')

  if !defined(Package['node']) {
    package { 'node':
      ensure => 'present'
    }
  }

  exec { "install npm n":
    command => "npm install -g n",
    require => Package["node"]
  }

  exec { "install npm n default version":
    command => "n ${node_version}",
    require => Exec["install npm n"]
  }
}
