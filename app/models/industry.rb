class Industry < ActiveRecord::Base
	belongs_to :user
	has_many :categories
end
