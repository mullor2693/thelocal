class Admin::FoodsController < Admin::ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Nutrición", :admin_nutrition_path
  add_breadcrumb "Alimentos", :admin_foods_path

  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
    add_breadcrumb @food.name, admin_food_path(@food)
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to [:admin, @food], notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @food] }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update    
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to [:admin, @food], notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @food] }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to admin_foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find_by(id: params[:id])
      redirect_to admin_foods_path, alert: 'Food not found on the system.' if @food.blank?
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:name, :description)
    end

end
