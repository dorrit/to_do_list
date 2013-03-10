require 'spec_helper'
	
describe Task do 
	context 'validations' do 
		it {should validate_presence_of :name}
		it {should validate_uniqueness_of :name}
		#it {should validate_leng}

		it 'validates that the task name is between 3-100 characters long' do
			task = Task.new(:name => "xo")
			task.save
			task.save.should be_false
		end

		it 'validates that the task name is between 3-100 characters long' do
			task = Task.new(:name => "supercalifragilisticexpialidocioussupercalifragilisticexpialidocioussupercalifragilisticexpialidocious")
			task.save
			task.save.should be_false
		end

		it 'validates that the task name is between 3-100 characters long' do
			task = Task.new(:name => "exercise")
			task.save
			task.save.should be_true
		end
	end

	context 'callbacks' do
		it 'converts the name to lowercase' do 
			task = Task.create(:name => "FINAGLE THE BUFFALO")
			task.name.should eq 'finagle the buffalo'
		end
	end

	context 'associations' do 
		it {should belong_to :list}
	end



			
end