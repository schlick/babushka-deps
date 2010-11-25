dep 'textmate plugins' do
  requires 'TextMate.app'
  
  # load in all bundles
  requires 'AckMate.tmplugin'
end

# https://github.com/protocool/AckMate
dep 'AckMate.tmplugin' do
  requires 'ackrc'
  source 'http://github.com/downloads/protocool/AckMate/AckMate.1.1.2.zip'
end

# https://github.com/protocool/AckMate/wiki
dep 'ackrc' do
  helper :path do
    '~/.ackrc'
  end
  met? { path.p.exists? }
  meet do
    file_contents = "--type-add=ruby=.haml
--type-add=ruby=.scss
--type-add=ruby=.sass
--type-add=ruby=.feature"
    File.open(path.p, 'w') { |file| file.write(file_contents)}
  end
end

# not sure how to handle a private download
# our PeepCode subscription has expired so we can't download PeepOpen again
# need to install from a local repository
dep 'PeepOpen.tmplugin' do
  
end
