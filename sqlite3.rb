dep 'sqlite3', :template => 'src' do
  met? { failable_shell("sqlite3 --version").stdout == '3.7.3' }
  source 'http://www.sqlite.org/sqlite-amalgamation-3.7.3.tar.gz'
  preconfigure {
    echo 'Hello'
  }
  configure {
    log_shell "configure", "./sqlite-3.7.3/configure"
  }
end