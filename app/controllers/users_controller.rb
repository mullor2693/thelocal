class UsersController < ApplicationController
  before_action :set_users
  before_action :set_user, only: %i[ show ]

  # GET /users or /users.json
  def index
  end

  # GET /users/1 or /users/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users
      @users = User.all
    end

    def set_user
      @user = @users.find_by(id: params[:id])
      if @user.blank?
        redirect_to(users_path, alert: "El usuario no existe, revise los datos.")
        return
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :surname, :birth_date, :sex, :phone)
    end
end
