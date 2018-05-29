require 'test_helper'

class ProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @provider = providers(:one)
  end

  test "should get index" do
    get providers_url
    assert_response :success
  end

  test "should get new" do
    get new_provider_url
    assert_response :success
  end

  test "should create provider" do
    assert_difference('Provider.count') do
      post providers_url, params: { provider: { alias: @provider.alias, codigo_proveedor: @provider.codigo_proveedor, correo_encargado: @provider.correo_encargado, direccion: @provider.direccion, encargado: @provider.encargado, razon_social: @provider.razon_social, rfc: @provider.rfc, telefono_encargado: @provider.telefono_encargado, user_id: @provider.user_id } }
    end

    assert_redirected_to provider_url(Provider.last)
  end

  test "should show provider" do
    get provider_url(@provider)
    assert_response :success
  end

  test "should get edit" do
    get edit_provider_url(@provider)
    assert_response :success
  end

  test "should update provider" do
    patch provider_url(@provider), params: { provider: { alias: @provider.alias, codigo_proveedor: @provider.codigo_proveedor, correo_encargado: @provider.correo_encargado, direccion: @provider.direccion, encargado: @provider.encargado, razon_social: @provider.razon_social, rfc: @provider.rfc, telefono_encargado: @provider.telefono_encargado, user_id: @provider.user_id } }
    assert_redirected_to provider_url(@provider)
  end

  test "should destroy provider" do
    assert_difference('Provider.count', -1) do
      delete provider_url(@provider)
    end

    assert_redirected_to providers_url
  end
end
