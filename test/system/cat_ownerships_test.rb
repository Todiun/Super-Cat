require "application_system_test_case"

class CatOwnershipsTest < ApplicationSystemTestCase
  setup do
    @cat_ownership = cat_ownerships(:one)
  end

  test "visiting the index" do
    visit cat_ownerships_url
    assert_selector "h1", text: "Cat ownerships"
  end

  test "should create cat ownership" do
    visit cat_ownerships_url
    click_on "New cat ownership"

    click_on "Create Cat ownership"

    assert_text "Cat ownership was successfully created"
    click_on "Back"
  end

  test "should update Cat ownership" do
    visit cat_ownership_url(@cat_ownership)
    click_on "Edit this cat ownership", match: :first

    click_on "Update Cat ownership"

    assert_text "Cat ownership was successfully updated"
    click_on "Back"
  end

  test "should destroy Cat ownership" do
    visit cat_ownership_url(@cat_ownership)
    click_on "Destroy this cat ownership", match: :first

    assert_text "Cat ownership was successfully destroyed"
  end
end
