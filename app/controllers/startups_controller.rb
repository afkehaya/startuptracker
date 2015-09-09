class StartupsController < ApplicationController
 before_action :set_startup, :authenticate_user!

	def create
		@startup = @startupable.startups.new startup_params
		@startup.user = current_user
		@startup.save
		redirect_to @startupable, notice: "Your startup was added succesfully."
		authorize @startup
	end
	def index

	end
	def import
		count = Startup.import params[:file]
		redirect_to @startupable, notice: "Imported #{count} startups"
		authorize @startup
	end

	private
	 def set_startup
	 	@startup = Startup.find(params[:category_id])
	 	authorize @startup
	 end 

	def startup_params
		params.require(:startup).permit(:company, :url)
	end
end 