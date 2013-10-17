#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'rake/testtask'
#Bundler::GemHelper.install_tasks

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/lib/**/*_test.rb']
  t.verbose = true
end

desc "Runinng tests"
task :default => :test
