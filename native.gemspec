# -*- encoding: utf-8 -*-
require File.expand_path(File.join('..', 'lib', 'native', 'version'), __FILE__)

Gem::Specification.new do |gem|
    gem.name                  = 'native'
    gem.version               = Native::VERSION
    gem.platform              = Gem::Platform::RUBY
    gem.summary               = 'Build native apps for all major platforms from your Rails applications'
    gem.description           = 'Build native apps for all major platforms from your Rails applications.'
    gem.authors               = 'Jonas Hübotter'
    gem.email                 = 'jonas.huebotter@gmail.com'
    gem.homepage              = 'https://github.com/NativeGap/native-rails'
    gem.license               = 'MIT'

    gem.files                 = Dir['README.md', 'CHANGELOG.md', 'LICENSE', 'lib/**/*', 'app/**/*', 'config/**/*', 'vendor/**/*']
    gem.require_paths         = ['lib']

    gem.post_install_message  = IO.read('INSTALL.md')

    gem.required_ruby_version = '>= 2.3'

    gem.add_dependency 'rails', '>= 5.0'

    gem.add_development_dependency 'rspec', '~> 3.7'
    gem.add_development_dependency 'rubocop', '~> 0.52'
end
