#install nginx and config 
exec { 'sudo apt update':
  provider => shell,
}

exec { 'sudo apt install -y nginx':
  provider => shell,
  }

package { 'nginx':
  ensure  => installed,
}


service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

exec { "sudo ufw allow 'Nginx HTTP'":
  provider => shell,
  require  => Service['nginx'],
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
  require => Package['nginx'],
}

$config_direct = "server_name _;\n\trewrite ^/redirect_me https://github.com/Abel-alx-github permanent;"

exec { 'sudo sed -i "s/server_name _;/$config_direct/" /etc/nginx/sites-enabled/default':
  provider => shell,
}

$config_error = "listen 80 default_server;\nerror_page 404 /my_error404.html;"

exec { 'sudo sed -i "s/listen 80 default_server;/$config_error/" /etc/nginx/sites-enabled/default':
  provider  => shell,
}

file { '/var/www/html/my_error404.html':
  content => "Ceci n'est pas une page",
  require => Package['nginx'],
}

file { '/var/www/html/redirect_me':
  content => 'https://github.com/Abel-alx-github',
  require => Package['nginx'],
}

exec { 'sudo service nginx restart':
  provider => shell,
}
