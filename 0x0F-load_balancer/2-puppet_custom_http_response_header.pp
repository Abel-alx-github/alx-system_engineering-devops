#install nginx and config 


exec{'http header':
    command  => 'sudo apt-get -y update &&
               sudo apt-get install -y nginx && 
               sudo sed -i "/server_name _/a add_header X-Served-By $hostname;" '/etc/sites-enabled/default' &&
               sudo service nginx restart',
    provider => shell,
}
