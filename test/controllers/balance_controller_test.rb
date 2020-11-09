require 'test_helper'

class BalanceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get balance_index_url
    assert_response :success
  end

  test "should get new" do
    get balance_new_url
    assert_response :success
  end

  test "should get edit" do
    get balance_edit_url
    assert_response :success
  end

end