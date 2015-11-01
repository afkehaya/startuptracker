class Categories::StartupsController < StartupsController
before_action :set_startupable
	def show
	end

	def create
		@startup = @startupable.startups.new startup_params
		@startup.user = current_user
		@startup.save
		redirect_to industry_category_path(id: @startupable.id)
		authorize @startup
	end

	private

	def set_startupable
		@startupable = Category.find(params[:category_id])
		authorize @startupable
	end

	def set_startup
		@startup = Startup.find(params[:id])
		authorize @startup
	end
end
