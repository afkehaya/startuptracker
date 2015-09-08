class Startup < ActiveRecord::Base
	belongs_to :startupable, polymorphic: true
	belongs_to :user

	def self.import(file)
			counter = 0
			CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
				startup = Startup.assign_from_row(row)
				if startup.save
					counter += 1 
				else
					puts "#{startup.company} - #{startup.errors.full_messages.join(",")}" 
				end	
			end	
		counter
	end

	def self.assign_from_row(row)
		startup = Startup.where(company: row[:company]).first_or_initialize
		startup.assign_attributes row.to_hash.slice(:url)
		startup
	end
end
