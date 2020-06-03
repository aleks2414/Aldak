class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service, except: [:index, :new, :create, :show, :search]

  # GET /services
  # GET /services.json
  def index
    @q = Service.ransack(params[:q])
    @services = @q.result.includes(:order).uniq
    @services = @services.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @service = Service.find_by(codigo_remision: params[:id])
  end

  def etapa_1
    
  end

  def etapa_2
    
  end

  def etapa_3
    
  end

  def etapa_4
    
  end

  def etapa_5
    
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    @service.user_id = current_user.id
    @service.codigo_remision = @service.get_code
    @service.precio_de_compra = @service.product.costo_producto
    @service.precio_de_venta = @service.order.precio_unitario

    respond_to do |format|
      if @service.save
        @service.charter.update(status: @service.charter.set_status)
        @service.provider.update(status: @service.provider.set_status)

        format.html { redirect_to etapa_1_service_path(@service), notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    if params[:id].present?
      begin
        @service = Service.find(params[:id])
        redirect_to quantity_service_url(@service)
      rescue ActiveRecord::RecordNotFound
        @message = 'Service not found'
      end
    end
  end

  def quantity
    @service = Service.find(params[:id])
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_back fallback_location: root_path, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:user_id, :order_id, :cantidad, :fecha_de_entrega, :status_operativo, :status_comercial, :etapa, :provider_id, :requiere_factura_p, :pago_a_proveedor, :pagado_proveedor, :charter_id, :requiere_factura_f, :pago_a_fletera, :pagado_fletera, :codigo_remision, :gasto_operacion, :cantidad_real_etregada, :pago_real_p, :gr, :numero_de_factura, :kilos_finales, :total_por_facturar, :fecha_de_facturacion, :fecha_por_cobrar, :pagado, :total_venta, :ganancia, :proveedor, :fletera, :iva_proveedor, :iva_fletera, :product_id, :client_id, :image, :satisfaction)
    end
end
