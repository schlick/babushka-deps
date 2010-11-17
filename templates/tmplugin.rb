meta :tmplugin, :for => :osx do
  accepts_list_for :source

  template {
    requires 'TextMate.app' #, 'textmate not running'
    helper :path do
      '~/Library/Application Support/TextMate/Plugins' / name
    end
    met? { path.dir? }
    before { shell "mkdir -p #{path.parent}" }
    meet {
      source.each {|uri|
        Babushka::Resource.extract uri
        shell "open ~/.babushka/build/AckMate.1.1.2/#{name}"
        sleep 1
      }
    }
  }
end