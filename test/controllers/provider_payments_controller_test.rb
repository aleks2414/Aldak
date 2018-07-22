require 'test_helper'

class ProviderPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @provider_payment = provider_payments(:one)
  end

  test "should get index" do
    get provider_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_provider_payment_url
    assert_response :success
  end

  test "should create provider_payment" do
    assert_difference('ProviderPayment.count') do
      post provider_payments_url, params: { provider_payment: { cantidad: @provider_payment.cantidad, fecha: @provider_payment.fecha, provider_id: @provider_payment.provider_id } }
    end

    assert_redirected_to provider_payment_url(ProviderPayment.last)
  end

  test "should show provider_payment" do
    get provider_payment_url(@provider_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_provider_payment_url(@provider_payment)
    assert_response :success
  end

  test "should update provider_payment" do
    patch provider_payment_url(@provider_payment), params: { provider_payment: { cantidad: @provider_payment.cantidad, fecha: @provider_payment.fecha, provider_id: @provider_payment.provider_id } }
    assert_redirected_to provider_payment_url(@provider_payment)
  end

  test "should destroy provider_payment" do
    assert_difference('ProviderPayment.count', -1) do
      delete provider_payment_url(@provider_payment)
    end

    assert_redirected_to provider_payments_url
  end
end
