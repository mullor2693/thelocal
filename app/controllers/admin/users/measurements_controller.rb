class Admin::Users::MeasurementsController < Admin::Users::ApplicationController
  before_action :set_user_measurements
  before_action :set_measurement, only: [:show, :edit, :update, :destroy]

  # GET /measurements
  # GET /measurements.json
  def index
  end

  # GET /measurements/1
  # GET /measurements/1.json
  def show
  end

  # GET /measurements/new
  def new
    @measurement = Measurement.new
    @measurement.user = @user
    @measurement.evaluation_date = Time.current.strftime("%d-%m-%YT%H:%M")
  end

  # GET /measurements/1/edit
  def edit
  end

  # POST /measurements
  # POST /measurements.json
  def create
    @measurement = Measurement.new(measurement_params)
    @measurement.user = @user
    @measurement.creator = current_user
    respond_to do |format|
      if @measurement.save
        format.html { redirect_to [:admin, @user, @measurement], notice: 'Measurement was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @user, @measurement] }
      else
        format.html { render :new }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurements/1
  # PATCH/PUT /measurements/1.json
  def update
    respond_to do |format|
      if @measurement.update(measurement_params)
        format.html { redirect_to [:admin, @user, @measurement], notice: 'Measurement was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @user, @measurement] }
      else
        format.html { render :edit }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurements/1
  # DELETE /measurements/1.json
  def destroy
    @measurement.destroy
    respond_to do |format|
      format.html { redirect_to admin_user_measurements_url(@user), notice: 'Measurement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_measurements
      add_breadcrumb @user.full_name, admin_user_path(@user)
      @measurements = @user.measurements
      add_breadcrumb "Mediciones", :admin_user_measurements_path
    end

    def set_measurement
      @measurement = @measurements.find_by(id: params[:id])
      redirect_to admin_user_measurements_path(@user), alert: 'Medición no encontrada para este usuario.' if @measurement.blank?
    end
    # Only allow a list of trusted parameters through.
    def measurement_params
      params.require(:measurement).permit(:shoulder, :pecs, :right_arm, :left_arm, :right_forearm, :left_forearm, :waist, :hip, :right_leg, :left_leg, :right_twin, :left_twin, :evaluation_date)
    end
end
