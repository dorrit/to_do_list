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

  context '.not_done' do
  	it 'returns only not done tasks' do
  		not_done_tasks = (1..5).to_a.map {|number| Task.create(:name => "task #{number}", :done=> false )}
  		done_task = Task.create(:name => "done task", :done => true)
  		Task.not_done.should eq not_done_tasks
  	end
  end


			
end