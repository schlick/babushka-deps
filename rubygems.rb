dep 'setup rubygems' do
  requires 'rubygems', 'config .gemrc', 'hanna.gem'
end

dep 'config .gemrc' do
  setup { render_erb "config/gemrc.erb", :to => "~/.gemrc" }
end

# currently installed version 2.3.0
dep 'hanna.gem' do
end

# regenerate existing rdocs
dep 'regenerate rdoc' do
  setup { shell "gem rdoc --all --no-ri" }
end