require "application_system_test_case"

class EventAssigneesTest < ApplicationSystemTestCase
  setup do
    @event_assignee = event_assignees(:one)
  end

  test "visiting the index" do
    visit event_assignees_url
    assert_selector "h1", text: "Event Assignees"
  end

  test "creating a Event assignee" do
    visit event_assignees_url
    click_on "New Event Assignee"

    fill_in "Event", with: @event_assignee.event_id
    fill_in "User", with: @event_assignee.user_id
    click_on "Create Event assignee"

    assert_text "Event assignee was successfully created"
    click_on "Back"
  end

  test "updating a Event assignee" do
    visit event_assignees_url
    click_on "Edit", match: :first

    fill_in "Event", with: @event_assignee.event_id
    fill_in "User", with: @event_assignee.user_id
    click_on "Update Event assignee"

    assert_text "Event assignee was successfully updated"
    click_on "Back"
  end

  test "destroying a Event assignee" do
    visit event_assignees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event assignee was successfully destroyed"
  end
end
