class Admin::DietsController < Admin::ApplicationController
  before_action :set_diets
  before_action :set_diet, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Nutrición", :admin_nutrition_path
  add_breadcrumb "Dietas", :admin_diets_path

  # GET /diets
  # GET /diets.json
  def index
  end

  # GET /diets/1
  # GET /diets/1.json
  def show
    add_breadcrumb @diet.name, admin_diet_path(@diet)
  end

  # GET /diets/new
  def new
    @diet = @diets.new
  end

  # GET /diets/1/edit
  def edit
    add_breadcrumb @diet.name, admin_diet_path(@diet)
  end

  # POST /diets
  # POST /diets.json
  def create
    @diet = @diets.new(diet_params)
    @diet.creator = @current_user
    respond_to do |format|
      if @diet.save
        # track("diet.create", @diet)
        format.html { redirect_to [:admin, @diet], notice: 'Diet was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @diet] }
      else
        format.html { render :new }
        format.js { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diets/1
  # PATCH/PUT /diets/1.json
  def update
    respond_to do |format|
      if @diet.update(diet_params)
        format.html { redirect_to [:admin, @diet], notice: 'Dieta actualizada con éxito.' }
        format.json { render :show, status: :ok, location: [:admin, @diet] }
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
      format.html { redirect_to admin_diets_url, notice: 'Diet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diets
      @diets = Diet.all
    end

    def set_diet
      @diet = @diets.find_by(id: params[:id])
      redirect_to diets_path, alert: 'Diet not found on user.' if @diet.blank?
    end

    # Only allow a list of trusted parameters through.
    def diet_params
      params.require(:diet).permit(:name, :description, meals_attributes: [:name], weekdays: [])
    end
end
