require 'test_helper'

class CitizensControllerTest < ActionController::TestCase
  setup do
    @citizen = citizens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:citizens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create citizen" do
    assert_difference('Citizen.count') do
      post :create, citizen: { code: @citizen.code, is_valid: @citizen.is_valid, name: @citizen.name }
    end

    assert_redirected_to citizen_path(assigns(:citizen))
  end

  test "should show citizen" do
    get :show, id: @citizen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @citizen
    assert_response :success
  end

  test "should update citizen" do
    patch :update, id: @citizen, citizen: { code: @citizen.code, is_valid: @citizen.is_valid, name: @citizen.name }
    assert_redirected_to citizen_path(assigns(:citizen))
  end

  test "should destroy citizen" do
    assert_difference('Citizen.count', -1) do
      delete :destroy, id: @citizen
    end

    assert_redirected_to citizens_path
  end
end
