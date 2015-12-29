class projects::dcp {

  # include package::docker
  #
  # exec { "setup docker registery":
  #   command => "echo 'EXTRA_ARGS=\"--insecure-registry artifactory-demo.kroger.com\"' | sudo tee -a /var/lib/boot2docker/profile",
  #   require => Package["docker"]
  # }
  #
  # exec { "setup docker registery":
  #   command => "sudo /etc/init.d/docker restart",
  #   require => Exec["setup docker registery"]
  # }

}
