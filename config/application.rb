require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Insutech
  class Application < Rails::Application
    config.action_mailer.default_url_options = { host: "45.55.41.101" }
    # config.action_mailer.delivery_method = :smtp
    # config.action_mailer.smtp_settings = { address: "127.0.0.1", port: 25, domain: "insutech-eg.net" }
    config.action_mailer.sendmail_settings = {
            locaiton: "/usr/sbin/sendmail",
            arguments: '-i -t'
    }
    config.action_mailer.delivery_method = :sendmail
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default charset: "utf-8"
    # config.action_mailer.smtp_settings = {
    #   :address              => 'smtp.gmail.com',
    #   :port                 => 587,
    #   :domain               => 'gmail.com',
    #   :user_name            => 'mark.yehia@gmail.com',
    #   :password             => 'wizard93',
    #   :authentication       => :plain,
    #   :enable_starttls_auto => true,
    #   :openssl_verify_mode  => 'none'
    # }
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
