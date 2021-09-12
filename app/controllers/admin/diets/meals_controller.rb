class Admin::Diets::MealsController < Admin::Diets::ApplicationController
  before_action :set_diet_meals
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  # GET /meals
  # GET /meals.json
  def index
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
  end

  # GET /meals/new
  def new
    @meal = @meals.new
    @meal.meal_foods.build
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  # POST /meals.json
  def create
    @meal = @meals.new(meal_params)
    respond_to do |format|
      if @meal.save
        DietMeal.create(diet: @diet, meal: @meal, daytime: @meal&.daytime || 0)
        format.html { redirect_to [:admin, @diet], notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @diet, @meal] }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to [:admin, @diet, @meal], notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @diet, @meal] }
      else
        format.html { render :show, location: [:admin, @diet, @meal] }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to admin_diet_meals_path(@diet), notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diet_meals
      @meals = @diet.meals
      add_breadcrumb @diet.name, admin_diet_path(@diet)
      add_breadcrumb "Comida", request.url
    end

    def set_meal
      @meal = @meals.find_by(id: params[:id])
      redirect_to admin_diet_meals_path(@diet), alert: 'Meal not found on the diet.' if @meal.blank?
    end

    # Only allow a list of trusted parameters through.
    def meal_params
      params.require(:meal).permit(:name, :daytime, :diet, meal_foods_attributes: [:food_id, :quantity, :unit])
    end
end
