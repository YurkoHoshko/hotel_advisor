#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

HotelAdvisor::Application.load_tasks

# This defines your new spec task with a suppressed stack trace
RSpec::Core::RakeTask.new(:spec) do |t|
  t.fail_on_error = false
end
