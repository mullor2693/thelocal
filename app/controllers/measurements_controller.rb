class MeasurementsController < ApplicationController
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
    @measurement = @measurements.new
    render :edit
  end

  # GET /measurements/1/edit
  def edit
  end

  # POST /measurements
  # POST /measurements.json
  def create
    @measurement = @measurements.new(measurement_params)
    @measurement.creator = @current_user
    respond_to do |format|
      if @measurement.save
        format.html { redirect_to @measurement, notice: 'Measurement was successfully created.' }
        format.json { render :show, status: :created, location: @measurement }
      else
        format.html { render :edit }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurements/1
  # PATCH/PUT /measurements/1.json
  def update
    respond_to do |format|
      if @measurement.update(measurement_params)
        format.html { redirect_to @measurement, notice: 'Measurement was successfully updated.' }
        format.json { render :show, status: :ok, location: @measurement }
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
      format.html { redirect_to measurements_url, notice: 'Measurement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_measurements
      @measurements = @current_user.measurements
    end

    def set_measurement
      @measurement = @measurements.find_by(id: params[:id])
      redirect_to measuresments_path, alert: 'Measuresment not found on user.' if @measurement.blank?
    end

    # Only allow a list of trusted parameters through.
    def measurement_params
      params.require(:measurement).permit(:evaluation_date, :shoulder, :pecs, :right_arm, :left_arm, :right_forearm, :left_forearm, :waist, :hip, :right_leg, :left_leg, :right_twin, :left_twin, :user_id)
    end
end
