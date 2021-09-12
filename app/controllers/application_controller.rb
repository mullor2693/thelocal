class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_current_user
    # add_breadcrumb "Home", :authenticated_root_path

	def after_sign_in_path_for(resource)
		dashboard_path
	end

	def set_current_user
        @current_user = User.with_attached_avatar.find_by(id: current_user&.id) if current_user.present?
    end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :birth_date, :sex, :phone, :email, :password, :avatar)}
		devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :birth_date, :sex, :phone, :email, :password, :current_password, :avatar)}
	end
end
