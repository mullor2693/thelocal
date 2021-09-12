class Admin::WorkoutsController < Admin::ApplicationController
  before_action :set_workouts
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Entrenamiento", :admin_training_path
  add_breadcrumb "Rutinas", :admin_workouts_path

  # GET /workouts
  # GET /workouts.json
  def index
    @workouts = Workout.all
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
  end

  # GET /workouts/new
  def new
    @workout = Workout.new
    @workout.creator = @current_user
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @workout = Workout.new(workout_params)
    @workout.creator = @current_user
    respond_to do |format|
      if @workout.save
        track("workout.create", @workout)
        format.html { redirect_to [:admin, @workout], notice: 'Workout was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @workout] }
      else
        format.html { render :new }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        track("workout.update", @workout)
        format.html { redirect_to [:admin, @workout], notice: 'Workout was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @workout] }
      else
        format.html { render :edit }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout.destroy
    respond_to do |format|
      track("workout.destroy", @workout)
      format.html { redirect_to admin_workouts_url, notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workouts
      @workouts = Workout.all
    end

    def set_workout
      @workout = @workouts.find_by(id: params[:id])
      redirect_to workouts_path, alert: 'Exercise not found on the workout.' if @workout.blank?
    end

    # Only allow a list of trusted parameters through.
    def workout_params
      params.require(:workout).permit(:name, :description, weekdays:[])
    end
end
