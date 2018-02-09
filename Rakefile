require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

system 'bundle'
system 'gem build nativegap.gemspec'


RSpec::Core::RakeTask.new

task default: :spec
