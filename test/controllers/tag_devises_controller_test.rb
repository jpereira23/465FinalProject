require 'test_helper'

class TagDevisesControllerTest < ActionController::TestCase
  setup do
    @tag_devise = tag_devises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tag_devises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag_devise" do
    assert_difference('TagDevise.count') do
      post :create, tag_devise: { devise_id: @tag_devise.devise_id, tag_id: @tag_devise.tag_id }
    end

    assert_redirected_to tag_devise_path(assigns(:tag_devise))
  end

  test "should show tag_devise" do
    get :show, id: @tag_devise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tag_devise
    assert_response :success
  end

  test "should update tag_devise" do
    patch :update, id: @tag_devise, tag_devise: { devise_id: @tag_devise.devise_id, tag_id: @tag_devise.tag_id }
    assert_redirected_to tag_devise_path(assigns(:tag_devise))
  end

  test "should destroy tag_devise" do
    assert_difference('TagDevise.count', -1) do
      delete :destroy, id: @tag_devise
    end

    assert_redirected_to tag_devises_path
  end
end
