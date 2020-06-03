class ProviderPaymentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_provider_payment, only: [:show, :edit, :update, :destroy]

  # GET /provider_payments
  # GET /provider_payments.json
  def index
    @provider_payments = ProviderPayment.all
  end

  # GET /provider_payments/1
  # GET /provider_payments/1.json
  def show
  end

  # GET /provider_payments/new
  def new
    @provider_payment = ProviderPayment.new
  end

  # GET /provider_payments/1/edit
  def edit
  end

  # POST /provider_payments
  # POST /provider_payments.json
  def create
    @provider_payment = ProviderPayment.new(provider_payment_params)

    respond_to do |format|
      if @provider_payment.save
        @provider_payment.provider.update(status: @provider_payment.provider.set_status)

        format.html { redirect_to provider_path(@provider_payment.provider), notice: 'Provider payment was successfully created.' }
        format.json { render :show, status: :created, location: @provider_payment }
      else
        format.html { render :new }
        format.json { render json: @provider_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provider_payments/1
  # PATCH/PUT /provider_payments/1.json
  def update
    respond_to do |format|
      if @provider_payment.update(provider_payment_params)
        format.html { redirect_to provider_path(@provider_payment.provider), notice: 'Provider payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider_payment }
      else
        format.html { render :edit }
        format.json { render json: @provider_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provider_payments/1
  # DELETE /provider_payments/1.json
  def destroy
    @provider_payment.destroy
    respond_to do |format|
      format.html { redirect_to provider_path(@provider_payment.provider), notice: 'Provider payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider_payment
      @provider_payment = ProviderPayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_payment_params
      params.require(:provider_payment).permit(:provider_id, :cantidad, :fecha)
    end
end
