class Admin::ApplicationController < ApplicationController
    before_action :authenticate_admin
    add_breadcrumb "Admin", :admin_authenticated_root_path

    private

    def authenticate_admin
        unless @current_user.has_role?(:admin)
            flash[:alert] = "No tiene permiso para acceder al panel de administración."
            redirect_to authenticated_root_path
        end
        @current_admin = @current_user
    end
        
end
