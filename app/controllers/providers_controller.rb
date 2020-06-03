class ProvidersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  # GET /providers
  # GET /providers.json
  def index
    @q = Provider.ransack(params[:q])
    @providers = @q.result.uniq
    @providers = @providers.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
    @dates = (@provider.provider_payments.group_by { |m| m.fecha.beginning_of_month }.keys + @provider.services.group_by { |m| m.fecha_de_entrega.beginning_of_month }.keys).uniq.sort
  end

  # GET /providers/new
  def new
    @provider = Provider.new
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)
    @provider.user_id = current_user.id

    respond_to do |format|
      if @provider.save
        format.html { redirect_to @provider, notice: 'Provider was successfully created.' }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to @provider, notice: 'Provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'Provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:user_id, :alias, :rfc, :razon_social, :direccion, :encargado, :telefono_encargado, :correo_encargado, :codigo_proveedor)
    end
end
