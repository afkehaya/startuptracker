class StartupsController < ApplicationController
 before_action :authenticate_user!
 
	def create
		@startup = @startupable.startups.new startup_params
		@startup.user = current_user
		@startup.save
		redirect_to @startupable, notice: "Your startup was added successfully."
		authorize @startup
	end

	private

	def startup_params
		params.require(:startup).permit(:company, :url)
	end
end 