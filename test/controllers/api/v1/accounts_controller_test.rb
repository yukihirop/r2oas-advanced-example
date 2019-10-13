require 'test_helper'

class Api::V1::AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_account = api_v1_accounts(:one)
  end

  test "should get index" do
    get api_v1_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_account_url
    assert_response :success
  end

  test "should create api_v1_account" do
    assert_difference('Api::V1::Account.count') do
      post api_v1_accounts_url, params: { api_v1_account: { content: @api_v1_account.content, status: @api_v1_account.status } }
    end

    assert_redirected_to api_v1_account_url(Api::V1::Account.last)
  end

  test "should show api_v1_account" do
    get api_v1_account_url(@api_v1_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_account_url(@api_v1_account)
    assert_response :success
  end

  test "should update api_v1_account" do
    patch api_v1_account_url(@api_v1_account), params: { api_v1_account: { content: @api_v1_account.content, status: @api_v1_account.status } }
    assert_redirected_to api_v1_account_url(@api_v1_account)
  end

  test "should destroy api_v1_account" do
    assert_difference('Api::V1::Account.count', -1) do
      delete api_v1_account_url(@api_v1_account)
    end

    assert_redirected_to api_v1_accounts_url
  end
end
