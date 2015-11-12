class Industry < ActiveRecord::Base
	belongs_to :user
	has_many :categories

	searchkick text_start: [:name]
end
