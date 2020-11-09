require 'test_helper'

class PaymentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get payment_index_url
    assert_response :success
  end

  test "should get new" do
    get payment_new_url
    assert_response :success
  end

  test "should get edit" do
    get payment_edit_url
    assert_response :success
  end

end