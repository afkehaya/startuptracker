class Category < ActiveRecord::Base
	has_many :startups, as: :startupable
end
