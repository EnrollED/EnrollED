require 'test_helper'

class KlasiusSrvsControllerTest < ActionController::TestCase
  setup do
    @klasius_srv = klasius_srvs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:klasius_srvs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create klasius_srv" do
    assert_difference('KlasiusSrv.count') do
      post :create, klasius_srv: { code: @klasius_srv.code, description__sl: @klasius_srv.description__sl, description_en: @klasius_srv.description_en, id: @klasius_srv.id, is_valid: @klasius_srv.is_valid, level: @klasius_srv.level, parent: @klasius_srv.parent }
    end

    assert_redirected_to klasius_srv_path(assigns(:klasius_srv))
  end

  test "should show klasius_srv" do
    get :show, id: @klasius_srv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @klasius_srv
    assert_response :success
  end

  test "should update klasius_srv" do
    patch :update, id: @klasius_srv, klasius_srv: { code: @klasius_srv.code, description__sl: @klasius_srv.description__sl, description_en: @klasius_srv.description_en, id: @klasius_srv.id, is_valid: @klasius_srv.is_valid, level: @klasius_srv.level, parent: @klasius_srv.parent }
    assert_redirected_to klasius_srv_path(assigns(:klasius_srv))
  end

  test "should destroy klasius_srv" do
    assert_difference('KlasiusSrv.count', -1) do
      delete :destroy, id: @klasius_srv
    end

    assert_redirected_to klasius_srvs_path
  end
end
