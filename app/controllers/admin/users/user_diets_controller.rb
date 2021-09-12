class Admin::Diets::UserDietsController < Admin::Users::ApplicationController
  before_action :set_diet_user_diets
  before_action :set_user_diet, only: [:show, :edit, :update, :destroy]

  # GET /user_diets/new
  def new
    @user_diet = @user_diets.new
    render :edit
  end

  # GET /user_diets/1/edit
  def edit
    render :edit
  end

  # POST /user_diets
  # POST /user_diets.json
  def create
    @user_diet = @user_diets.new(user_diet_params)
    respond_to do |format|
      if @user_diet.save
        format.html { redirect_to [:admin, @diet], notice: 'Comida creada y asociada a la dieta.' }
        format.json { render :show, status: :created, location: [:admin, @diet] }
      else
        format.html { render :edit }
        format.json { render json: @user_diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_diets/1
  # PATCH/PUT /user_diets/1.json
  def update
    respond_to do |format|
      if @user_diet.update(user_diet_params)
        format.html { redirect_to [:admin, @diet], notice: 'Comida actualizada la dieta.' }
        format.json { render :show, status: :ok, location: [:admin, @diet] }
      else
        format.html { render :edit }
        format.json { render json: @user_diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_diets/1
  # DELETE /user_diets/1.json
  def destroy
    @user_diet.destroy
    respond_to do |format|
      format.html { redirect_to admin_diet_path(@diet), notice: 'Meal food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diet_user_diets
      @user_diets = @diet.user_diets
    end

    def set_user_diet
      @user_diet = @user_diets.find_by(id: params[:id])
      redirect_to admin_diet_path(@diet), alert: 'La relación no se encuentra en la dieta.' if @user_diet.blank?
    end

    # Only allow a list of trusted parameters through.
    def user_diet_params
      params.require(:user_diet).permit(:daytime, meal_attributes: [:name])
    end
end
