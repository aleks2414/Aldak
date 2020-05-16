class AddProductAndClientToService < ActiveRecord::Migration[6.0]
  def up
    add_reference :services, :product, foreign_key: true
    add_reference :services, :client, foreign_key: true

    Order.all.each do |order|
      order.services.each do |service|
        service.update(product_id: order.product_id, client_id: order.client_id)
      end
    end
  end

  def down
    Service.all.each do |service|
      service.order.update(product_id: service.product_id, client_id: service.client_id)
    end

    remove_reference :services, :product, foreign_key: true
    remove_reference :services, :client, foreign_key: true
  end
end
