class DietsController < ApplicationController
  before_action :set_user_diets
  before_action :set_diet, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Nutrición", :nutrition_path
  add_breadcrumb "Dietas", :diets_path

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
    @diet = @diets.new
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
        @current_user.diets << @diet
        format.html { redirect_to @diet, notice: 'Diet was successfully created.' }
        format.json { render :show, status: :created, location: @diet }
      else
        format.html {  }
        format.js { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diets/1
  # PATCH/PUT /diets/1.json
  def update
    respond_to do |format|
      if @diet.update(diet_params)
        format.html { redirect_to @diet, notice: 'Diet was successfully updated.' }
        format.json { render :show, status: :ok, location: @diet }
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
      format.html { redirect_to diets_url, notice: 'Diet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_diets
      @diets = @current_user.diets
    end

    def set_diet
      @diet = @diets.find_by(id: params[:id])
      redirect_to diets_path, alert: 'Diet not found on user.' if @diet.blank?
    end

    # Only allow a list of trusted parameters through.
    def diet_params
      params.require(:diet).permit(:name, :description, weekdays:[])
    end
end
