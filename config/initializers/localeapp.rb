require 'localeapp/rails'

Localeapp.configure do |config|
  config.api_key = 'hS5oqivMKNmqzRbsIWurtkVn2He8QXmNqySebcfHk7dokM8IJg'
  config.polling_environments = [:development] # Doesn't include :staging or :production
  #config.sending_environments = [:development]
  #config.polling_environments = [:staging] # Doesn't include :production
end
