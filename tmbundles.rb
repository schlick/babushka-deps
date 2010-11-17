dep 'textmate bundles' do
  requires 'TextMate.app'
  
  # load in all bundles
  requires 'Ruby on Rails.tmbundle'
  requires 'Cucumber.tmbundle'
  requires 'Ruby Haml.tmbundle'
  requires 'RSpec.tmbundle'
  requires 'SCSS.tmbundle'
end

dep 'Ruby on Rails.tmbundle' do
  source 'git://github.com/drnic/ruby-on-rails-tmbundle.git'
end

# TODO: what about setting the TM_CUCUMBER shell variable?
dep 'Cucumber.tmbundle' do
  source 'git://github.com/aslakhellesoy/cucumber-tmbundle.git'
end

dep 'Ruby Haml.tmbundle' do
  source 'git://github.com/mattpolito/ruby-haml.tmbundle.git'
end

dep 'RSpec.tmbundle' do
  source 'git://github.com/rspec/rspec-tmbundle.git'
end

dep 'SCSS.tmbundle' do
  source 'git://github.com/kuroir/SCSS.tmbundle.git'
end