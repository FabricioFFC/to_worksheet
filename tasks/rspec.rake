require 'rubygems'
require 'rspec'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:test) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['--backtrace']
end
