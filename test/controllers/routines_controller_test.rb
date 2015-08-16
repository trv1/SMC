require 'test_helper'

class RoutinesControllerTest < ActionController::TestCase
  setup do
    @routine = routines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:routines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create routine" do
    assert_difference('Routine.count') do
      post :create, routine: { polyclinic_id: @routine.polyclinic_id, post_id: @routine.post_id, schedule_id: @routine.schedule_id, timing: @routine.timing }
    end

    assert_redirected_to routine_path(assigns(:routine))
  end

  test "should show routine" do
    get :show, id: @routine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @routine
    assert_response :success
  end

  test "should update routine" do
    patch :update, id: @routine, routine: { polyclinic_id: @routine.polyclinic_id, post_id: @routine.post_id, schedule_id: @routine.schedule_id, timing: @routine.timing }
    assert_redirected_to routine_path(assigns(:routine))
  end

  test "should destroy routine" do
    assert_difference('Routine.count', -1) do
      delete :destroy, id: @routine
    end

    assert_redirected_to routines_path
  end
end
