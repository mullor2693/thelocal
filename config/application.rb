require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Thelocal
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # config.to_prepare do
    #   Devise::SessionsController.layout "other_layout"
    #   Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "other_layout" }
    #   Devise::ConfirmationsController.layout "other_layout"
    #   Devise::UnlocksController.layout "other_layout"            
    #   Devise::PasswordsController.layout "other_layout"        
    # end

    config.action_view.form_with_generates_remote_forms = false

    config.action_view.field_error_proc =  Proc.new{ |html_tag, instance| 
      "<span class=\"has-danger\">#{html_tag}</span>".html_safe
    }

  end
end
