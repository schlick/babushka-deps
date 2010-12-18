# Local sites are run with the suggested configuration from
# http://blog.phusion.nl/2010/09/21/phusion-passenger-running-multiple-ruby-versions/
#
# The default is Ruby 1.9.2 and apps that require Ruby 1.8.7 are run through the reverse proxy

# List the reverse proxies here only

dep 'questions.local' do
  project_path '~/amc/core/questions'
  port '3001'
end

dep 'scinews.local' do
  project_path '~/Sites/scinews'
  port '3002'
end

dep 'credentials.local' do
  project_path '~/amc/legacy/credentials'
  port '3003'
end

dep 'accreditation.local' do
  project_path '~/amc/core/accreditation'
  port '3004'
end

dep 'payments.local' do
  project_path '~/amc/non-core/payments'
  port '3005'
end

dep 'wba.local' do
  project_path '~/amc/legacy/wba'
  port '3006'
end

dep 'wizard.local' do
  project_path '~/amc/legacy/wizard'
  port '3007'
end

dep 'store.local' do
  project_path '~/amc/non-core/store'
  port '3008'
end

dep 'support.local' do
  project_path '~/amc/non-core/support'
  port '3009'
end

dep 'trial-exam.local' do
  project_path '~/amc/non-core/trial-exam'
  port '3010'
end