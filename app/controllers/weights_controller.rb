class WeightsController < ApplicationController
  before_action :set_user_weights
  before_action :set_weight, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Nutrición", :nutrition_path
  add_breadcrumb "Peso", :weights_path

  # GET /weights
  # GET /weights.json
  def index
  end

  # GET /weights/1
  # GET /weights/1.json
  def show
  end

  # GET /weights/new
  def new
    @weight = @weights.new
    @weight.evaluation_date = DateTime.now()
  end

  # GET /weights/1/edit
  def edit
  end

  # POST /weights
  # POST /weights.json
  def create
    @weight = @weights.new(weight_params)
    respond_to do |format|
      if @weight.save
        format.html { redirect_to weights_path, notice: 'Nuevo peso añadido.' }
        format.json { render :index, status: :created, location: @weight }
      else
        format.html { render :new }
        format.js { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weights/1
  # PATCH/PUT /weights/1.json
  def update
    respond_to do |format|
      if @weight.update(weight_params)
        format.html { redirect_to weights_path, notice: 'Peso actualizado.' }
        format.json { render :index, status: :ok, location: @weight }
      else
        format.html { render :edit }
        format.json { render json: @weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weights/1
  # DELETE /weights/1.json
  def destroy
    @weight.destroy
    respond_to do |format|
      format.html { redirect_to weights_url, notice: 'Weight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_weights
      @weights = @current_user.weights
      @last_weight = @current_user.last_weight
    end

    def set_weight
      @weight = @weights.find_by(id: params[:id])
      redirect_to weights_path, alert: 'Exercise not found on the workout.' if @weight.blank?
    end

    # Only allow a list of trusted parameters through.
    def weight_params
      params.require(:weight).permit(:score, :evaluation_date, :notes)
    end
end
