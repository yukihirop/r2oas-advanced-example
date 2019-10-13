require "application_system_test_case"

class Api::V2::CustomPostsTest < ApplicationSystemTestCase
  setup do
    @api_v2_custom_post = api_v2_custom_posts(:one)
  end

  test "visiting the index" do
    visit api_v2_custom_posts_url
    assert_selector "h1", text: "Api/V2/Custom Posts"
  end

  test "creating a Custom post" do
    visit api_v2_custom_posts_url
    click_on "New Api/V2/Custom Post"

    fill_in "Content", with: @api_v2_custom_post.content
    fill_in "Status", with: @api_v2_custom_post.status
    click_on "Create Custom post"

    assert_text "Custom post was successfully created"
    click_on "Back"
  end

  test "updating a Custom post" do
    visit api_v2_custom_posts_url
    click_on "Edit", match: :first

    fill_in "Content", with: @api_v2_custom_post.content
    fill_in "Status", with: @api_v2_custom_post.status
    click_on "Update Custom post"

    assert_text "Custom post was successfully updated"
    click_on "Back"
  end

  test "destroying a Custom post" do
    visit api_v2_custom_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Custom post was successfully destroyed"
  end
end
