require 'test_helper'

class TagArticlesControllerTest < ActionController::TestCase
  setup do
    @tag_article = tag_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tag_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag_article" do
    assert_difference('TagArticle.count') do
      post :create, tag_article: { article_id: @tag_article.article_id, article_id: @tag_article.article_id, tag_id: @tag_article.tag_id }
    end

    assert_redirected_to tag_article_path(assigns(:tag_article))
  end

  test "should show tag_article" do
    get :show, id: @tag_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tag_article
    assert_response :success
  end

  test "should update tag_article" do
    patch :update, id: @tag_article, tag_article: { article_id: @tag_article.article_id, article_id: @tag_article.article_id, tag_id: @tag_article.tag_id }
    assert_redirected_to tag_article_path(assigns(:tag_article))
  end

  test "should destroy tag_article" do
    assert_difference('TagArticle.count', -1) do
      delete :destroy, id: @tag_article
    end

    assert_redirected_to tag_articles_path
  end
end
