# install ruby-foreman on server
sudo apt install ruby-foreman

# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) NOPASSWD:ALL

# create yml file on config/projects directory
	application: application name
	server_ip: remote server ip
	repo_url: repository url adres
	branch: define branch name
	server_user: server user name
	assets: boolean value
	migrations: boolean value
