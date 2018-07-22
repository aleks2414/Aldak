require 'test_helper'

class CharterPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @charter_payment = charter_payments(:one)
  end

  test "should get index" do
    get charter_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_charter_payment_url
    assert_response :success
  end

  test "should create charter_payment" do
    assert_difference('CharterPayment.count') do
      post charter_payments_url, params: { charter_payment: { cantidad: @charter_payment.cantidad, charter_id: @charter_payment.charter_id, fecha: @charter_payment.fecha } }
    end

    assert_redirected_to charter_payment_url(CharterPayment.last)
  end

  test "should show charter_payment" do
    get charter_payment_url(@charter_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_charter_payment_url(@charter_payment)
    assert_response :success
  end

  test "should update charter_payment" do
    patch charter_payment_url(@charter_payment), params: { charter_payment: { cantidad: @charter_payment.cantidad, charter_id: @charter_payment.charter_id, fecha: @charter_payment.fecha } }
    assert_redirected_to charter_payment_url(@charter_payment)
  end

  test "should destroy charter_payment" do
    assert_difference('CharterPayment.count', -1) do
      delete charter_payment_url(@charter_payment)
    end

    assert_redirected_to charter_payments_url
  end
end
