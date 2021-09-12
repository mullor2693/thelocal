class Admin::Users::ApplicationController < Admin::ApplicationController
    before_action :get_user
    add_breadcrumb "Usuarios", :admin_users_path

    private

    def get_user
        @user = User.find_by(id: params[:user_id])
        redirect_to admin_users_path if @user.nil?
    end
        
end
