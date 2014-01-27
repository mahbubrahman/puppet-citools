class profile::jenkins {
  
  class { '::jenkins':
    jenkins_port => '8181',
  }
  
  firewall { '100 allow tomcat jenkins':
    proto  => 'tcp',  
    port   => '8181',
    action => 'accept',
  }    
  
}


