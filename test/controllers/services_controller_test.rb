require 'test_helper'

class ServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service = services(:one)
  end

  test "should get index" do
    get services_url
    assert_response :success
  end

  test "should get new" do
    get new_service_url
    assert_response :success
  end

  test "should create service" do
    assert_difference('Service.count') do
      post services_url, params: { service: { calidad_enviada: @service.calidad_enviada, cantidad: @service.cantidad, cantidad_real_etregada: @service.cantidad_real_etregada, charter_id: @service.charter_id, codigo_remision: @service.codigo_remision, condiciones_f: @service.condiciones_f, condiciones_p: @service.condiciones_p, etapa: @service.etapa, factura_recibida_f: @service.factura_recibida_f, factura_recibida_p: @service.factura_recibida_p, fecha_de_entrega: @service.fecha_de_entrega, fecha_de_facturacion: @service.fecha_de_facturacion, fecha_por_cobrar: @service.fecha_por_cobrar, gasto_operacion: @service.gasto_operacion, gr: @service.gr, kilos_finales: @service.kilos_finales, numero_de_factura: @service.numero_de_factura, order_id: @service.order_id, otro_enviada: @service.otro_enviada, pagado: @service.pagado, pagado_fletera: @service.pagado_fletera, pagado_proveedor: @service.pagado_proveedor, pago_a_fletera: @service.pago_a_fletera, pago_a_proveedor: @service.pago_a_proveedor, pago_real_p: @service.pago_real_p, provider_id: @service.provider_id, remision_enviada: @service.remision_enviada, remision_sellada: @service.remision_sellada, requiere_factura_f: @service.requiere_factura_f, requiere_factura_p: @service.requiere_factura_p, seguridad_enviada: @service.seguridad_enviada, status_comercial: @service.status_comercial, status_operativo: @service.status_operativo, tickets: @service.tickets, total_por_facturar: @service.total_por_facturar, user_id: @service.user_id } }
    end

    assert_redirected_to service_url(Service.last)
  end

  test "should show service" do
    get service_url(@service)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_url(@service)
    assert_response :success
  end

  test "should update service" do
    patch service_url(@service), params: { service: { calidad_enviada: @service.calidad_enviada, cantidad: @service.cantidad, cantidad_real_etregada: @service.cantidad_real_etregada, charter_id: @service.charter_id, codigo_remision: @service.codigo_remision, condiciones_f: @service.condiciones_f, condiciones_p: @service.condiciones_p, etapa: @service.etapa, factura_recibida_f: @service.factura_recibida_f, factura_recibida_p: @service.factura_recibida_p, fecha_de_entrega: @service.fecha_de_entrega, fecha_de_facturacion: @service.fecha_de_facturacion, fecha_por_cobrar: @service.fecha_por_cobrar, gasto_operacion: @service.gasto_operacion, gr: @service.gr, kilos_finales: @service.kilos_finales, numero_de_factura: @service.numero_de_factura, order_id: @service.order_id, otro_enviada: @service.otro_enviada, pagado: @service.pagado, pagado_fletera: @service.pagado_fletera, pagado_proveedor: @service.pagado_proveedor, pago_a_fletera: @service.pago_a_fletera, pago_a_proveedor: @service.pago_a_proveedor, pago_real_p: @service.pago_real_p, provider_id: @service.provider_id, remision_enviada: @service.remision_enviada, remision_sellada: @service.remision_sellada, requiere_factura_f: @service.requiere_factura_f, requiere_factura_p: @service.requiere_factura_p, seguridad_enviada: @service.seguridad_enviada, status_comercial: @service.status_comercial, status_operativo: @service.status_operativo, tickets: @service.tickets, total_por_facturar: @service.total_por_facturar, user_id: @service.user_id } }
    assert_redirected_to service_url(@service)
  end

  test "should destroy service" do
    assert_difference('Service.count', -1) do
      delete service_url(@service)
    end

    assert_redirected_to services_url
  end
end
