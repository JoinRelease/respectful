require Rails.root.join('config/environments/production')

Rails.application.configure do
  config.action_mailer.default_url_options = { host: 'join-respectful-staging.herokuapp.com' }
end
