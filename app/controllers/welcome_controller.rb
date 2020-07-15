class WelcomeController < ApplicationController
	before_action :authenticate_user!
  authorize_resource class: false

  def index
    @most_sold_product_id = Service.where(fecha_de_entrega: DateTime.now.beginning_of_month..DateTime.now.end_of_month).group(:product_id).sum(:cantidad_real_etregada).sort_by{|_key, value| value}.last.try(:first)

    @all_providers_balance = 0
    Provider.all.each do |provider|
      @all_providers_balance += provider.balance
    end

    @all_charters_balance = 0
    Charter.all.each do |charter|
      @all_charters_balance += charter.balance
    end

    @balance = params[:balance] || 'providers'

    @services0 = Service.where(pagado: false).order('id ASC')
    @services0 = @services0.paginate(:page => params[:page], :per_page => 10)

    @step = params[:step] || 1

  	@services1 = Service.where(etapa: 1).order('id ASC')
  	@services1 = @services1.paginate(:page => params[:page], :per_page => 10)
  	@services2 = Service.where(etapa: 2).order('id ASC')
  	@services2 = @services2.paginate(:page => params[:page], :per_page => 10)
  	@services3 = Service.where(etapa: 3).order('id ASC')
  	@services3 = @services3.paginate(:page => params[:page], :per_page => 10)
  	@services4 = Service.where(etapa: 4).order('id ASC')
  	@services4 = @services4.paginate(:page => params[:page], :per_page => 10)
  	@services5 = Service.where(etapa: 5).order('id ASC')
  	@services5 = @services5.paginate(:page => params[:page], :per_page => 10)


    end
  end

  def reindex
    [Client, Product, Service, Order, Provider, Charter].each { |model| model.reindex }
    render json: :done
  end
end
