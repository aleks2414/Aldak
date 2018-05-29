require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { cantidad: @order.cantidad, client_id: @order.client_id, descripcion: @order.descripcion, fecha_de_orden: @order.fecha_de_orden, nombre_encargado: @order.nombre_encargado, numero_de_orden: @order.numero_de_orden, precio_unitario: @order.precio_unitario, product_id: @order.product_id, user_id: @order.user_id, valor_total: @order.valor_total } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { cantidad: @order.cantidad, client_id: @order.client_id, descripcion: @order.descripcion, fecha_de_orden: @order.fecha_de_orden, nombre_encargado: @order.nombre_encargado, numero_de_orden: @order.numero_de_orden, precio_unitario: @order.precio_unitario, product_id: @order.product_id, user_id: @order.user_id, valor_total: @order.valor_total } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
