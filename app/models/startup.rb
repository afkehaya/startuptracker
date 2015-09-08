class Startup < ActiveRecord::Base
	belongs_to :startupable, polymorphic: true
	belongs_to :user

	def self.assign_from_row(row)
		startup = Startup.where(company: row[:company]).first_or_initialize
		startup.assign_attributes row.to_hash.slice(:url)
		startup
	end
end
