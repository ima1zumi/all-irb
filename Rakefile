# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/all-irb/test*.rb']
end

task default: :test