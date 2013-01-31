# Great reference is:
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx

dep 'macosx setup' do
  requires 'prevent .ds_store file creation on network volumes'
  requires 'configure global git settings'
end

### Individual deps...
# - ensure every dep checks for osx

# See http://support.apple.com/kb/HT1629
dep 'prevent .ds_store file creation on network volumes' do
  on :osx do
    shell %{defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true}
  end
end