$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "feed/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "feed"
  s.version     = Feed::VERSION
  s.authors     = ["Peleg Rosenthal"]
  s.email       = ["peleg3@gmail.com"]
  s.homepage    = "http://peleg.co"
  s.summary     = "Create activity feed with ease!"
  s.description = "Create activity feed with ease!"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"
  s.add_dependency "redis"
  s.add_dependency "sinatra"
  s.add_dependency "multi_json"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "debugger"
  s.add_development_dependency "rack-contrib"
end
