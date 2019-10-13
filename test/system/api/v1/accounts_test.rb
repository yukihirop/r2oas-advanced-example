require "application_system_test_case"

class Api::V1::AccountsTest < ApplicationSystemTestCase
  setup do
    @api_v1_account = api_v1_accounts(:one)
  end

  test "visiting the index" do
    visit api_v1_accounts_url
    assert_selector "h1", text: "Api/V1/Accounts"
  end

  test "creating a Account" do
    visit api_v1_accounts_url
    click_on "New Api/V1/Account"

    fill_in "Content", with: @api_v1_account.content
    fill_in "Status", with: @api_v1_account.status
    click_on "Create Account"

    assert_text "Account was successfully created"
    click_on "Back"
  end

  test "updating a Account" do
    visit api_v1_accounts_url
    click_on "Edit", match: :first

    fill_in "Content", with: @api_v1_account.content
    fill_in "Status", with: @api_v1_account.status
    click_on "Update Account"

    assert_text "Account was successfully updated"
    click_on "Back"
  end

  test "destroying a Account" do
    visit api_v1_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Account was successfully destroyed"
  end
end
