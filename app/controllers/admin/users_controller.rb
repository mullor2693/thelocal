class Admin::UsersController < Admin::ApplicationController
  before_action :set_users
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @user = User.new
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to [:admin, @user], notice: "User was successfully created." }
        format.json { render :show, status: :created, location: [:admin, @user] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to [:admin, @user], notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: [:admin, @user] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users
      @users = User.all
    end

    def set_user
      @user = @users.find_by(id: params[:id])
      if @user.blank?
        redirect_to(admin_users_path, alert: "El usuario no existe, revise los datos.")
        return
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :name, :surname, :birth_date, :sex, :phone, :avatar)
    end
end
