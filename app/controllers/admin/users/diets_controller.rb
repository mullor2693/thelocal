class Admin::Users::DietsController < Admin::Users::ApplicationController
  before_action :set_user_diets
  before_action :set_diet, only: [:show, :edit, :update, :destroy]

  # GET /diets
  # GET /diets.json
  def index
  end

  # GET /diets/1
  # GET /diets/1.json
  def show
  end

  # GET /diets/new
  def new
    @diet = Diet.new
  end

  # GET /diets/1/edit
  def edit
  end

  # POST /diets
  # POST /diets.json
  def create
    @diet = Diet.new(diet_params)
    @diet.creator = @current_user
    respond_to do |format|
      if @diet.save
        UserDiet.create(user: @user, diet: @diet)
        format.html { redirect_to [:admin, @user, @diet], notice: 'Diet was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @user, @diet] }
      else
        format.html { render :new }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diets/1
  # PATCH/PUT /diets/1.json
  def update
    respond_to do |format|
      if @diet.update(diet_params)
        format.html { redirect_to [:admin, @user, @diet], notice: 'Diet was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @user, @diet] }
      else
        format.html { render :edit }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diets/1
  # DELETE /diets/1.json
  def destroy
    @diet.destroy
    respond_to do |format|
      format.html { redirect_to admin_user_diets_url(@user), notice: 'Diet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_diets
      add_breadcrumb @user.full_name, admin_user_path(@user)
      @diets = @user.diets
      add_breadcrumb "Dietas", admin_user_diets_path(@user)
    end

    def set_diet
      @diet = @diets.find_by(id: params[:id])
      redirect_to admin_user_diets_path(@user), alert: 'Diet not found on user.' if @diet.blank?
    end

    # Only allow a list of trusted parameters through.
    def diet_params
      params.require(:diet).permit(:name, :description, weekdays:[])
    end
end
