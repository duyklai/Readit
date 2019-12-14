require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Readit
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # These paths will be ignored when redirecting the user to last visited page
    # Devise routes need to always be here, so that a redirect loop does not occur
    # after signing in
    config.ignored_paths = %W(/users/sign_in /users/sign_up /users/password /users/sign_out /users/confirm_password)
  end
end
