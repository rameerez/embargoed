lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'embargoed/version'

spec = Gem::Specification.new do |s|
  s.name = 'embargoed'
  s.version = Embargoed::VERSION
  s.summary = 'A gem to block visitors from Russia due to the Ukraine invasion'
  s.description = 'Embargoed blocks all visitors from Russia from your Rails application, displaying a pro-Ukraine message instead.'
  s.files = Dir['README.*', 'MIT-LICENSE', 'rails/*.rb', 'config/**/*.rb', 'lib/**/*.rb', 'lib/tasks/*.rake', 'public/*']
  s.require_path = 'lib'
  s.author = 'rameerez'
  s.email = 'hi@rameerez.com'
  s.homepage = 'https://github.com/rameerez/embargoed'
  s.license = 'MIT'
  s.add_dependency('tilt','>= 1.4', '< 3')
  s.add_dependency('rack', '>= 1.3', '< 3')
  s.add_dependency('rack-accept', '~> 0.4')
  s.add_dependency('i18n', '>= 0.7', '< 2')
  s.add_development_dependency('rack-test', '~> 0.6')
  s.add_development_dependency('rspec', '~> 3.0')
  s.add_development_dependency('rspec-its', '~> 1.0')

  s.add_development_dependency('simplecov', '~> 0.10', '>= 0.10')
  s.add_development_dependency('simplecov-summary', '~> 0.0.4', '>= 0.0.4')
end
