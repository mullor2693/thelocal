require "application_system_test_case"

class EventManagersTest < ApplicationSystemTestCase
  setup do
    @event_manager = event_managers(:one)
  end

  test "visiting the index" do
    visit event_managers_url
    assert_selector "h1", text: "Event Managers"
  end

  test "creating a Event manager" do
    visit event_managers_url
    click_on "New Event Manager"

    fill_in "Event", with: @event_manager.event_id
    fill_in "User", with: @event_manager.user_id
    click_on "Create Event manager"

    assert_text "Event manager was successfully created"
    click_on "Back"
  end

  test "updating a Event manager" do
    visit event_managers_url
    click_on "Edit", match: :first

    fill_in "Event", with: @event_manager.event_id
    fill_in "User", with: @event_manager.user_id
    click_on "Update Event manager"

    assert_text "Event manager was successfully updated"
    click_on "Back"
  end

  test "destroying a Event manager" do
    visit event_managers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event manager was successfully destroyed"
  end
end
