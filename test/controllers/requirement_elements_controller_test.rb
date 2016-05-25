require 'test_helper'

class RequirementElementsControllerTest < ActionController::TestCase
  setup do
    @requirement_element = requirement_elements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requirement_elements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requirement_element" do
    assert_difference('RequirementElement.count') do
      post :create, requirement_element: {  }
    end

    assert_redirected_to requirement_element_path(assigns(:requirement_element))
  end

  test "should show requirement_element" do
    get :show, id: @requirement_element
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requirement_element
    assert_response :success
  end

  test "should update requirement_element" do
    patch :update, id: @requirement_element, requirement_element: {  }
    assert_redirected_to requirement_element_path(assigns(:requirement_element))
  end

  test "should destroy requirement_element" do
    assert_difference('RequirementElement.count', -1) do
      delete :destroy, id: @requirement_element
    end

    assert_redirected_to requirement_elements_path
  end
end
