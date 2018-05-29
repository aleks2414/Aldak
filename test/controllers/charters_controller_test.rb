require 'test_helper'

class ChartersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @charter = charters(:one)
  end

  test "should get index" do
    get charters_url
    assert_response :success
  end

  test "should get new" do
    get new_charter_url
    assert_response :success
  end

  test "should create charter" do
    assert_difference('Charter.count') do
      post charters_url, params: { charter: { alias: @charter.alias, codigo_fletera: @charter.codigo_fletera, correo_encargado: @charter.correo_encargado, direccion: @charter.direccion, encargado: @charter.encargado, razon_social: @charter.razon_social, rfc: @charter.rfc, telefono_encargado: @charter.telefono_encargado, user_id: @charter.user_id } }
    end

    assert_redirected_to charter_url(Charter.last)
  end

  test "should show charter" do
    get charter_url(@charter)
    assert_response :success
  end

  test "should get edit" do
    get edit_charter_url(@charter)
    assert_response :success
  end

  test "should update charter" do
    patch charter_url(@charter), params: { charter: { alias: @charter.alias, codigo_fletera: @charter.codigo_fletera, correo_encargado: @charter.correo_encargado, direccion: @charter.direccion, encargado: @charter.encargado, razon_social: @charter.razon_social, rfc: @charter.rfc, telefono_encargado: @charter.telefono_encargado, user_id: @charter.user_id } }
    assert_redirected_to charter_url(@charter)
  end

  test "should destroy charter" do
    assert_difference('Charter.count', -1) do
      delete charter_url(@charter)
    end

    assert_redirected_to charters_url
  end
end
