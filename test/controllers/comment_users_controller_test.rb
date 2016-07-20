require 'test_helper'

class CommentUsersControllerTest < ActionController::TestCase
  setup do
    @comment_user = comment_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_user" do
    assert_difference('CommentUser.count') do
      post :create, comment_user: { comment_id: @comment_user.comment_id, user_id: @comment_user.user_id }
    end

    assert_redirected_to comment_user_path(assigns(:comment_user))
  end

  test "should show comment_user" do
    get :show, id: @comment_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_user
    assert_response :success
  end

  test "should update comment_user" do
    patch :update, id: @comment_user, comment_user: { comment_id: @comment_user.comment_id, user_id: @comment_user.user_id }
    assert_redirected_to comment_user_path(assigns(:comment_user))
  end

  test "should destroy comment_user" do
    assert_difference('CommentUser.count', -1) do
      delete :destroy, id: @comment_user
    end

    assert_redirected_to comment_users_path
  end
end
