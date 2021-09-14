class ExerciseSeriesController < ApplicationController
  before_action :set_exercise_series, only: %i[ show edit update destroy ]

  # GET /exercise_series or /exercise_series.json
  def index
    @exercise_series = ExerciseSeries.all
  end

  # GET /exercise_series/1 or /exercise_series/1.json
  def show
  end

  # GET /exercise_series/new
  def new
    @exercise_series = ExerciseSeries.new
  end

  # GET /exercise_series/1/edit
  def edit
  end

  # POST /exercise_series or /exercise_series.json
  def create
    @exercise_series = ExerciseSeries.new(exercise_series_params)

    respond_to do |format|
      if @exercise_series.save
        format.html { redirect_to @exercise_series, notice: "Exercise series was successfully created." }
        format.json { render :show, status: :created, location: @exercise_series }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercise_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercise_series/1 or /exercise_series/1.json
  def update
    respond_to do |format|
      if @exercise_series.update(exercise_series_params)
        format.html { redirect_to @exercise_series, notice: "Exercise series was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise_series }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercise_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_series/1 or /exercise_series/1.json
  def destroy
    @exercise_series.destroy
    respond_to do |format|
      format.html { redirect_to exercise_series_index_url, notice: "Exercise series was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise_series
      @exercise_series = ExerciseSeries.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_series_params
      params.require(:exercise_series).permit(:reps, :time_track, :exercise_workout_id)
    end
end
