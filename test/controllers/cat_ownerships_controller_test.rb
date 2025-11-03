require "test_helper"

class CatOwnershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cat_ownership = cat_ownerships(:one)
  end

  test "should get index" do
    get cat_ownerships_url
    assert_response :success
  end

  test "should get new" do
    get new_cat_ownership_url
    assert_response :success
  end

  test "should create cat_ownership" do
    assert_difference("CatOwnership.count") do
      post cat_ownerships_url, params: { cat_ownership: {} }
    end

    assert_redirected_to cat_ownership_url(CatOwnership.last)
  end

  test "should show cat_ownership" do
    get cat_ownership_url(@cat_ownership)
    assert_response :success
  end

  test "should get edit" do
    get edit_cat_ownership_url(@cat_ownership)
    assert_response :success
  end

  test "should update cat_ownership" do
    patch cat_ownership_url(@cat_ownership), params: { cat_ownership: {} }
    assert_redirected_to cat_ownership_url(@cat_ownership)
  end

  test "should destroy cat_ownership" do
    assert_difference("CatOwnership.count", -1) do
      delete cat_ownership_url(@cat_ownership)
    end

    assert_redirected_to cat_ownerships_url
  end
end
