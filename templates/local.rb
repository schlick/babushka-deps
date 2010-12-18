meta :local, :for => :osx do
  accepts_value_for :project_path
  accepts_value_for :port
  
  template {

    # NB: although it requires the passenger.gem, I don't want
    # to check for it everytime I start up a server
    # requires 'passenger.gem'

    # reverse proxies for ruby 1.8.7 only
    helper :passenger_path do
      '~/.rvm/gems/ruby-1.8.7-p302/bin'
    end

    met? { shell("nc -z #{name} #{port}") }
    meet { shell("cd #{project_path}; #{passenger_path}/passenger start -a #{name} -p #{port} -d")}

  }
end