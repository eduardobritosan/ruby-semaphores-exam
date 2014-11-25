$:.unshift File.dirname(__FILE__) + 'lib'
require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

require 'rdoc/task'

desc 'Generador de documentacion para gema Exam'

RDoc::Task.new do |rdoc|
	task :default => :rdoc
end