class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected


  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
          u.permit(:avatar,:name,:email,:password, :location, :dob, :mobile, :about, :password_confirmation)
      end

      devise_parameter_sanitizer.for(:account_update) do |u|
          u.permit(:avatar,:name,:email,:password, :location, :dob,:gender,:profession,:mobile, :about,:current_password, :password_confirmation)
      end
  end
  include PublicActivity::StoreController
=begin
  def configure_permitted_parameters
  	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name,:email,:password, :location, :dob, :mobile, :about, :password_confirmation)} 
      #devise_parameter_sanitizer.for(:sign_up) << [:name, :location, :dob, :mobile, :about, :password_confirmation]
      devise_parameter_sanitizer.for(:sign_in) << [:email,:password_confirmation, :remember_me]
  end
=end
end
