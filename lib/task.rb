class Task < ActiveRecord::Base
	validates :name, :presence => true, :uniqueness => true
	before_save :downcase_name

	validates :name, :length => {
    :minimum   => 3,
    :maximum   => 100}

    belongs_to :list


	private
		def downcase_name
			self.name = self.name.downcase 
		end
end