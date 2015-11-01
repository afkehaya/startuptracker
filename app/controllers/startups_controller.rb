class StartupsController < ApplicationController
 before_action :authenticate_user!
 
	def create
		@startup = @startupable.startups.new startup_params
		@startup.user = current_user
		@startup.save
		redirect_to industry_category_path(id: @startupable.id)
		authorize @startup
	end

	private

	def startup_params
		params.require(:startup).permit(:company, :url)
	end
end 