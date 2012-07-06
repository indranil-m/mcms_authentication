module McmsAuthentication
  class Engine < ::Rails::Engine
    require 'devise'
    require "cancan"

    # Writting configurations
    config.to_prepare do


      Devise::SessionsController.layout "users/devise"
      Devise::PasswordsController.layout "users/devise"

    end

    # Custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths += %W(#{config.root}/lib)

    config.autoload_paths += Dir["#{config.root}/lib/**/"]
  end
end
