class profile::artifactory {
  
  class { '::java': } ->
  class {'::artifactory':}

  firewall { '100 allow tomcat artifactory':
    proto  => 'tcp',  
    port   => '8081',
    action => 'accept',
  }  
}