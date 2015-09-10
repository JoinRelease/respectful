require Rails.root.join('config/environments/production')

Rails.application.configure do
  config.action_mailer.default_url_options = { host: 'wwww.joinrespectful.com' }

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: '587',
    authentication: :plain,
    user_name: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD'],
    domain: 'heroku.com',
    enable_starttls_auto: true
  }
end
