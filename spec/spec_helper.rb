require 'active_record'
require 'rspec'
require 'task'
require 'shoulda-matchers'
require 'lists'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])
RSpec.configure do |config|
	config.after(:all) do
		Task.all.each {|task| task.destroy}
	end
end

