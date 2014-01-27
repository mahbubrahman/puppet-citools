class role::jenkins_artifactory {
  
  include profile::artifactory
  include profile::jenkins
  
  
  # class { '::epel': } ->
  # class { '::avahi':
  #  firewall => true
  # }  
  
}
