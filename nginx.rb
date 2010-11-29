dep 'webserver startup script.nginx' do
  # requires 'webserver installed.src'
  on :osx do
    met? { !sudo('launchctl list').split("\n").grep(/nginx/).empty? }
    meet {
      render_erb 'nginx/nginx.launchd.erb', :to => '/Library/LaunchDaemons/nginx.plist', :sudo => true
      sudo 'launchctl load -w /Library/LaunchDaemons/nginx.plist'
    }
  end
end

# http://blog.phusion.nl/2010/09/21/phusion-passenger-running-multiple-ruby-versions/

# TODO: add virtual host into main nginx conf
# Partial Nginx configuration
# passenger_ruby /home/someuser/.rvm/wrappers/ruby-1.8.7/ruby
# 
# server {
#     listen 80;
#     server_name www.foo.com;
#     root /webapps/foo.com/public;
#     passenger_enabled on;
# }
# 
# server {
#     listen 80;
#     server_name www.bar.com;
#     root /webapps/bar.com/public;
#     passenger_enabled on;
# }

# TODO: start up all standalone passengers
# rvm use 1.8.7
# gem install passenger
# cd /webapps/fries.com
# passenger start -a 127.0.0.1 -p 3000 -d

# TODO: setup nginx conf for proxy_pass
# Partial Nginx configuration
# server {
#     listen 80;
#     server_name www.fries.com;
#     root /webapps/fries.com/public;
#     location / {
#         proxy_pass http://127.0.0.1:3000;
#         proxy_set_header Host $host;
#     }
# }