class Startup < ActiveRecord::Base
	belongs_to :startupable, polymorphic: true
end
