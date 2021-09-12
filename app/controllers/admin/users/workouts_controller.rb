class Admin::Users::WorkoutsController < Admin::Users::ApplicationController
  before_action :set_user_workouts
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  # GET /workouts
  # GET /workouts.json
  def index
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
  end

  # GET /workouts/new
  def new
    @workout = Workout.new(user: @user)
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @workout = Workout.new(workout_params)
    @workout.user = @user
    respond_to do |format|
      if @workout.save
        format.html { redirect_to [:admin, @user, @workout], notice: 'Workout was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @user, @workout] }
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
        format.html { redirect_to [:admin, @user, @workout], notice: 'Workout was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @user, @workout] }
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
      format.html { redirect_to admin_user_workouts_path, notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_workouts
      add_breadcrumb @user.full_name, admin_user_path(@user)
      @workouts = @user.workouts
      add_breadcrumb "Rutinas", admin_user_workouts_path(@user)
      
    end

    def set_workout
      @workout = @workouts.find_by(id: params[:id])
      redirect_to admin_user_workouts_path(@user) if @workout.nil?
    end

    # Only allow a list of trusted parameters through.
    def workout_params
      params.require(:workout).permit(:name, :description, weekdays:[])
    end
end
