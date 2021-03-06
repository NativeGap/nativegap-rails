# -*- encoding: utf-8 -*-
require File.expand_path(File.join('..', 'lib', 'native_gap', 'version'), __FILE__)

Gem::Specification.new do |gem|
    gem.name                  = 'nativegap'
    gem.version               = NativeGap::VERSION
    gem.platform              = Gem::Platform::RUBY
    gem.summary               = 'Build native apps for all major platforms from your Rails applications'
    gem.description           = 'Build native apps for all major platforms from your Rails applications.'
    gem.authors               = 'Jonas Hübotter'
    gem.email                 = 'me@jonhue.me'
    gem.homepage              = 'https://github.com/NativeGap/nativegap-rails'
    gem.license               = 'MIT'

    gem.files                 = Dir['README.md', 'CHANGELOG.md', 'LICENSE', 'lib/**/*', 'app/**/*', 'config/**/*']
    gem.require_paths         = ['lib']

    gem.required_ruby_version = '>= 2.3'

    gem.add_dependency 'rails', '>= 5.0'
    gem.add_dependency 'mozaic', '~> 2.0'

    gem.add_development_dependency 'rspec', '~> 3.7'
    gem.add_development_dependency 'rubocop', '~> 0.52'
end
