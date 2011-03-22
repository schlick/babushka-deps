# Prevent .DS_Store file creation on network volumes
# http://support.apple.com/kb/HT1629
#
# Be a nice netizen
#
# Works on Mac OS X 10.6 (but I haven't actually tried it)

dep 'macosx setup' do
  # TODO: require that I'm operating on a Mac?
  requires 'prevent .ds_store file creation on network volumes'
end

dep 'prevent .ds_store file creation on network volumes' do
  shell %{defaults write com.apple.desktopservices DSDontWriteNetworkStores true}
end