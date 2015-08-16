require 'test_helper'

class PolyclinicsControllerTest < ActionController::TestCase
  setup do
    @polyclinic = polyclinics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:polyclinics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create polyclinic" do
    assert_difference('Polyclinic.count') do
      post :create, polyclinic: { address: @polyclinic.address, district: @polyclinic.district, locality: @polyclinic.locality, name: @polyclinic.name, phone: @polyclinic.phone }
    end

    assert_redirected_to polyclinic_path(assigns(:polyclinic))
  end

  test "should show polyclinic" do
    get :show, id: @polyclinic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @polyclinic
    assert_response :success
  end

  test "should update polyclinic" do
    patch :update, id: @polyclinic, polyclinic: { address: @polyclinic.address, district: @polyclinic.district, locality: @polyclinic.locality, name: @polyclinic.name, phone: @polyclinic.phone }
    assert_redirected_to polyclinic_path(assigns(:polyclinic))
  end

  test "should destroy polyclinic" do
    assert_difference('Polyclinic.count', -1) do
      delete :destroy, id: @polyclinic
    end

    assert_redirected_to polyclinics_path
  end
end
