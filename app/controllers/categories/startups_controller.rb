class Categories::StartupsController < StartupsController
before_action :set_startupable

	private

	def set_startupable
		@startupable = Category.find(params[:category_id])
	end
end
