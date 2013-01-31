dep 'setup rubygems' do
  requires 'rubygems', 'create .gemrc'
end

dep 'create .gemrc' do
  source = File.dirname(load_path)
  shell %{ cp "#{source}"/config/gemrc ~/.gemrc }
end