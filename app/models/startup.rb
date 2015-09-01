class Startup < ActiveRecord::Base
	belongs_to :startupable, polymorphic: true
	belongs_to :user
end
