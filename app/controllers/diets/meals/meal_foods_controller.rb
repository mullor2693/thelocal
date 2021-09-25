class Diets::Meals::MealFoodsController < Diets::Meals::ApplicationController
  before_action :set_user_meal_foods
  before_action :set_meal_food, only: [:show, :edit, :update, :destroy]

  # GET /meal_foods
  # GET /meal_foods.json
  def index
  end

  # GET /meal_foods/1
  # GET /meal_foods/1.json
  def show
  end

  # GET /meal_foods/new
  def new
    @meal_food = @meal_foods.new
  end

  # GET /meal_foods/1/edit
  def edit
  end

  # POST /meal_foods
  # POST /meal_foods.json
  def create
    @meal_food = @meal_foods.new(meal_food_params)
    respond_to do |format|
      if @meal_food.save
        format.html { redirect_to [@diet, @meal, @meal_food], notice: 'Meal food was successfully created.' }
        format.json { render :show, status: :created, location: [@diet, @meal, @meal_food] }
      else
        format.html { render :edit }
        format.json { render json: @meal_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_foods/1
  # PATCH/PUT /meal_foods/1.json
  def update
    respond_to do |format|
      if @meal_food.update(meal_food_params)
        format.html { redirect_to [@diet, @meal, @meal_food], notice: 'Meal food was successfully updated.' }
        format.json { render :show, status: :ok, location: [@diet, @meal, @meal_food] }
      else
        format.html { render :edit }
        format.json { render json: @meal_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_foods/1
  # DELETE /meal_foods/1.json
  def destroy
    @meal_food.destroy
    respond_to do |format|
      format.html { redirect_to diet_meal_path(@diet, @meal), notice: 'Meal food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_meal_foods
      @meal_foods = @meal.meal_foods
    end

    def set_meal_food
      @meal_food = @meal_foods.find_by(id: params[:id])
      redirect_to diet_meal_path(@diet, @meal), alert: 'Meal food not found on the meal.' if @meal_food.blank?
    end

    # Only allow a list of trusted parameters through.
    def meal_food_params
      params.require(:meal_food).permit(:food_id, :quantity, :unit)
    end
end
