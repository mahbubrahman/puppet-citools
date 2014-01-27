class role::jenkins_artifactory {
  include profile::jenkins
  include profile::artifactory
  
  # class { '::epel': } ->
  # class { '::avahi':
  #  firewall => true
  # }  
  
}
