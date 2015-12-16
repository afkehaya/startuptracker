class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  include Pundit 
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_action :verify_authorized, unless: :devise_controller? 

  def about
    authorize :application, :about?
  end 
  def home
    authorize :application, :home?
    @industries = Industry.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end


  private
  def user_not_authorized
    flash[:warning] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :remember_me, :name, :submission,  submissions_attributes:[:description, :business])}
    devise_parameter_sanitizer.for(:account_update) << :name
  end
 
end
