class Admin::Users::EvaluationsController < Admin::Users::ApplicationController
  before_action :set_user_evaluations
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /evaluations
  # GET /evaluations.json
  def index
  end

  def charts    
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
  end

  # GET /evaluations/new
  def new
    @evaluation = Evaluation.new
    @evaluation.user = @user
    @evaluation.evaluation_date = Time.current.strftime("%d-%m-%YT%H:%M")
  end

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.user = @user
    @evaluation.creator = current_user
    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to admin_user_evaluations_path(@user), notice: 'Evaluation was successfully created.' }
        format.json { render :index, status: :created, location: admin_user_evaluations_path(@user) }
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
        format.html { redirect_to admin_user_evaluations_path(@user), notice: 'Evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_user_evaluations_path(@user) }
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
      format.html { redirect_to admin_user_evaluations_url(@user), notice: 'Evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_evaluations
      add_breadcrumb @user.full_name, admin_user_path(@user)
      @evaluations = @user.evaluations
      add_breadcrumb "Evaluaciones", :admin_user_evaluations_path
    end

    def set_evaluation
      @evaluation = @evaluations.find_by(id: params[:id])
      redirect_to admin_user_evaluations_path(@user), alert: 'Evaluation not found on user.' if @evaluation.blank?
    end

    # Only allow a list of trusted parameters through.
    def evaluation_params
      params.require(:evaluation).permit(:height, :weight, :imc, :fat_rate, :slim_weight, :residual_weight, :muscle_weight, :triceps_skinfold, :subscapular_skinfold, :bicipital_skinfold, :axilliary_skinfold, :suprailiac_skinfold, :thoracic_skinfold, :abdominal_skinfold, :medialcalf_skinfold, :fist_bone_diametre, :femur_bone_diametre, :evaluation_date, :user_id)
    end
end
