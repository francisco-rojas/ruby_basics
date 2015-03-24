require 'bundler/gem_tasks'
require 'rake/testtask'

# creates the rake test task used to run the minitest specs
Rake::TestTask.new do |test|
  test.libs << 'spec'
  test.ruby_opts << "-rubygems"
  test.pattern = 'spec/**/*_spec.rb'
  test.verbose = true
end