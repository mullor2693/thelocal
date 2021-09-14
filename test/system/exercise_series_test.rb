require "application_system_test_case"

class ExerciseSeriesTest < ApplicationSystemTestCase
  setup do
    @exercise_series = exercise_series(:one)
  end

  test "visiting the index" do
    visit exercise_series_url
    assert_selector "h1", text: "Exercise Series"
  end

  test "creating a Exercise series" do
    visit exercise_series_url
    click_on "New Exercise Series"

    fill_in "Exercise workout", with: @exercise_series.exercise_workout_id
    fill_in "Reps", with: @exercise_series.reps
    fill_in "Time track", with: @exercise_series.time_track
    click_on "Create Exercise series"

    assert_text "Exercise series was successfully created"
    click_on "Back"
  end

  test "updating a Exercise series" do
    visit exercise_series_url
    click_on "Edit", match: :first

    fill_in "Exercise workout", with: @exercise_series.exercise_workout_id
    fill_in "Reps", with: @exercise_series.reps
    fill_in "Time track", with: @exercise_series.time_track
    click_on "Update Exercise series"

    assert_text "Exercise series was successfully updated"
    click_on "Back"
  end

  test "destroying a Exercise series" do
    visit exercise_series_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exercise series was successfully destroyed"
  end
end
