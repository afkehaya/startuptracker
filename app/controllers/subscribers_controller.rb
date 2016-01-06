class SubscribersController < ApplicationController

  def new
    @subscriber = Subscriber.new
    authorize @subscriber
  end

  def create
    @subscriber = Subscriber.new(user_signup_params)
    authorize @subscriber

    if @subscriber.save
      redirect_to root_url, notice: "You're report is on it's way!"
    else
      render action: 'new', alert: "Signup failed."
    end
     
  end

  private
    def set_subscriber
      @subscriber = Subscriber.find(params[:id])
      authorize @subscriber
    end

    def user_signup_params
      params.require(:subscriber).permit(:email)
    end

end