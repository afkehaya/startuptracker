class Category < ActiveRecord::Base
	has_many :startups, as: :startupable
	belongs_to :user
end
