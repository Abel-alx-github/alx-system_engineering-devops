#  using Puppet to make changes to our configuration file

file{'~/.ssh/shcool':
  ensure  =>  file,
  content =>  'HOST *
              IdentityFile ~/.ssh/school
              PasswordAuthentication no
              '
  }
