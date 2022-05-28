ENV["RACK_ENV"] = "test"
require_relative "../app"
require "rspec"

config.before(:each) do
  ActiveRecord::Base.subclasses.each(&:delete_all)
end
