$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mcms_authentication/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mcms_authentication"
  s.version     = McmsAuthentication::VERSION
  s.authors     = ["INDRANIL MUKHERJEE"]
  s.email       = ["indranil.since87@gmail.com"]
  s.summary     = "Most flexible authentication and authorization solution"
  s.description = "It's a combination of devise and CanCan gem and flexible to identify your modules"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  # s.add_dependency "jquery-rails"

  #s.add_development_dependency "sqlite3"
end
