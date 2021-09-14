require "test_helper"

class ExerciseSeriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise_series = exercise_series(:one)
  end

  test "should get index" do
    get exercise_series_index_url
    assert_response :success
  end

  test "should get new" do
    get new_exercise_series_url
    assert_response :success
  end

  test "should create exercise_series" do
    assert_difference('ExerciseSeries.count') do
      post exercise_series_index_url, params: { exercise_series: { exercise_workout_id: @exercise_series.exercise_workout_id, reps: @exercise_series.reps, time_track: @exercise_series.time_track } }
    end

    assert_redirected_to exercise_series_url(ExerciseSeries.last)
  end

  test "should show exercise_series" do
    get exercise_series_url(@exercise_series)
    assert_response :success
  end

  test "should get edit" do
    get edit_exercise_series_url(@exercise_series)
    assert_response :success
  end

  test "should update exercise_series" do
    patch exercise_series_url(@exercise_series), params: { exercise_series: { exercise_workout_id: @exercise_series.exercise_workout_id, reps: @exercise_series.reps, time_track: @exercise_series.time_track } }
    assert_redirected_to exercise_series_url(@exercise_series)
  end

  test "should destroy exercise_series" do
    assert_difference('ExerciseSeries.count', -1) do
      delete exercise_series_url(@exercise_series)
    end

    assert_redirected_to exercise_series_index_url
  end
end
