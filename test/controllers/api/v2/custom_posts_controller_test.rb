require 'test_helper'

class Api::V2::CustomPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v2_custom_post = api_v2_custom_posts(:one)
  end

  test "should get index" do
    get api_v2_custom_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v2_custom_post_url
    assert_response :success
  end

  test "should create api_v2_custom_post" do
    assert_difference('Api::V2::CustomPost.count') do
      post api_v2_custom_posts_url, params: { api_v2_custom_post: { content: @api_v2_custom_post.content, status: @api_v2_custom_post.status } }
    end

    assert_redirected_to api_v2_custom_post_url(Api::V2::CustomPost.last)
  end

  test "should show api_v2_custom_post" do
    get api_v2_custom_post_url(@api_v2_custom_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v2_custom_post_url(@api_v2_custom_post)
    assert_response :success
  end

  test "should update api_v2_custom_post" do
    patch api_v2_custom_post_url(@api_v2_custom_post), params: { api_v2_custom_post: { content: @api_v2_custom_post.content, status: @api_v2_custom_post.status } }
    assert_redirected_to api_v2_custom_post_url(@api_v2_custom_post)
  end

  test "should destroy api_v2_custom_post" do
    assert_difference('Api::V2::CustomPost.count', -1) do
      delete api_v2_custom_post_url(@api_v2_custom_post)
    end

    assert_redirected_to api_v2_custom_posts_url
  end
end
