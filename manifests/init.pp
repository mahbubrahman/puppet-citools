node default {
  # Setup pre and post run stages
  #stage { 'pre': before => Stage['main'] }
  #stage { 'post': after => Stage['main'] }
  
  # Apply role from fact or hieradata
  if $::iam_role == undef {
    include "role::jenkins_artifactory"
  } else {
    include "role::${::iam_role}"
  }
} 
