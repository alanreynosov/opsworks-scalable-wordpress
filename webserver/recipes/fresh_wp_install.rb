
remote_file '/tmp/wordpress-latest.zip' do
	source "wget http://wordpress.org/latest.tar.gz"
end

bash 'install-wodpress' do
	cwd ::File.dirname("/tmp")
    code <<-EOH
    	sudo unzip /tmp/wordpress-latest.zip -d /var/www/html/
    EOH
end



bash 'install-wp-cli' do
	cwd ::File.dirname("/tmp")
    code <<-EOH
    	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
    	chmod +x wp-cli.phar;
    	sudo mv wp-cli.phar /usr/local/bin/wp;
    EOH
end

