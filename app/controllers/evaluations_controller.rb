class EvaluationsController < ApplicationController
  before_action :set_user_evaluations
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /evaluations
  # GET /evaluations.json
  def index
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
  end

  # GET /evaluations/new
  def new
    @evaluation = @evaluations.new
  end

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = @evaluations.new(evaluation_params)
    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @evaluation }
      else
        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_evaluations
      @evaluations = @current_user.evaluations
    end

    def set_evaluation
      @evaluation = @evaluations.find_by(id: params[:id])
      redirect_to measuresments_path, alert: 'Measuresment not found on user.' if @evaluation.blank?
    end

    # Only allow a list of trusted parameters through.
    def evaluation_params
      params.require(:evaluation).permit(:height, :weight, :imc, :fat_rate, :slim_weight, :residual_weight, :muscle_weight, :triceps_skinfold, :subscapular_skinfold, :bicipital_skinfold, :axilliary_skinfold, :suprailiac_skinfold, :thoracic_skinfold, :abdominal_skinfold, :medialcalf_skinfold, :fist_bone_diametre, :femur_bone_diametre, :evaluation_date, :user_id)
    end
end
