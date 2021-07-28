require "test_helper"

class EventManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_manager = event_managers(:one)
  end

  test "should get index" do
    get event_managers_url
    assert_response :success
  end

  test "should get new" do
    get new_event_manager_url
    assert_response :success
  end

  test "should create event_manager" do
    assert_difference('EventManager.count') do
      post event_managers_url, params: { event_manager: { event_id: @event_manager.event_id, user_id: @event_manager.user_id } }
    end

    assert_redirected_to event_manager_url(EventManager.last)
  end

  test "should show event_manager" do
    get event_manager_url(@event_manager)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_manager_url(@event_manager)
    assert_response :success
  end

  test "should update event_manager" do
    patch event_manager_url(@event_manager), params: { event_manager: { event_id: @event_manager.event_id, user_id: @event_manager.user_id } }
    assert_redirected_to event_manager_url(@event_manager)
  end

  test "should destroy event_manager" do
    assert_difference('EventManager.count', -1) do
      delete event_manager_url(@event_manager)
    end

    assert_redirected_to event_managers_url
  end
end
