$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'static_data_engine/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'static_data_engine'
  s.version     = StaticDataEngine::VERSION
  s.authors     = ['Sim Kern Cheh']
  s.email       = ['kern.cheh@gmail.com']
  s.summary     = 'Convert data sources to Queryable endpoints'
  s.description = 'Convert data sources to Queryable endpoints'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 6.0.1'
  s.add_dependency 'elasticsearch', '~> 5'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rr', '~> 1.1'
end
