require 'localeapp/rails'

Localeapp.configure do |config|
  config.api_key = 'hS5oqivMKNmqzRbsIWurtkVn2He8QXmNqySebcfHk7dokM8IJg'
  #config.polling_environments = [:development] # Doesn't include :staging or :production
  #config.sending_environments = [:development]
  #config.polling_environments = [:staging] # Doesn't include :production

  config.poll_interval = 300 if Rails.env.staging?
  config.polling_environments = [:development, :staging]
  config.reloading_environments = [:development, :staging]
  config.sending_environments = [:development, :staging]
end

# Pull latest when dyno restarts on staging
if Rails.env.staging?
  Localeapp::CLI::Pull.new.execute
end


