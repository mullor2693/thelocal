require "test_helper"

class EventAssigneesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_assignee = event_assignees(:one)
  end

  test "should get index" do
    get event_assignees_url
    assert_response :success
  end

  test "should get new" do
    get new_event_assignee_url
    assert_response :success
  end

  test "should create event_assignee" do
    assert_difference('EventAssignee.count') do
      post event_assignees_url, params: { event_assignee: { event_id: @event_assignee.event_id, user_id: @event_assignee.user_id } }
    end

    assert_redirected_to event_assignee_url(EventAssignee.last)
  end

  test "should show event_assignee" do
    get event_assignee_url(@event_assignee)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_assignee_url(@event_assignee)
    assert_response :success
  end

  test "should update event_assignee" do
    patch event_assignee_url(@event_assignee), params: { event_assignee: { event_id: @event_assignee.event_id, user_id: @event_assignee.user_id } }
    assert_redirected_to event_assignee_url(@event_assignee)
  end

  test "should destroy event_assignee" do
    assert_difference('EventAssignee.count', -1) do
      delete event_assignee_url(@event_assignee)
    end

    assert_redirected_to event_assignees_url
  end
end
