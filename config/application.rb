require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"
# require "active_record/railtie"
# require "active_storage/engine"
# require "action_mailbox/engine"
# require "action_text/engine"

Bundler.require(*Rails.groups)

module Capstone  # <--- MAKE SURE THIS MATCHES YOUR APP NAME
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))

    # Add this to avoid generator errors
    config.generators.orm :mongoid
  end
end