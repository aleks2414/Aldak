class CharterPaymentsController < ApplicationController
  before_action :set_charter_payment, only: [:show, :edit, :update, :destroy]

  # GET /charter_payments
  # GET /charter_payments.json
  def index
    @charter_payments = CharterPayment.all
  end

  # GET /charter_payments/1
  # GET /charter_payments/1.json
  def show
  end

  # GET /charter_payments/new
  def new
    @charter_payment = CharterPayment.new
  end

  # GET /charter_payments/1/edit
  def edit
  end

  # POST /charter_payments
  # POST /charter_payments.json
  def create
    @charter_payment = CharterPayment.new(charter_payment_params)

    respond_to do |format|
      if @charter_payment.save
        format.html { redirect_to charter_path(@charter_payment.charter), notice: 'Charter payment was successfully created.' }
        format.json { render :show, status: :created, location: @charter_payment }
      else
        format.html { render :new }
        format.json { render json: @charter_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charter_payments/1
  # PATCH/PUT /charter_payments/1.json
  def update
    respond_to do |format|
      if @charter_payment.update(charter_payment_params)
        format.html { redirect_to charter_path(@charter_payment.charter), notice: 'Charter payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @charter_payment }
      else
        format.html { render :edit }
        format.json { render json: @charter_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charter_payments/1
  # DELETE /charter_payments/1.json
  def destroy
    @charter_payment.destroy
    respond_to do |format|
      format.html { redirect_to charter_payments_url, notice: 'Charter payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charter_payment
      @charter_payment = CharterPayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charter_payment_params
      params.require(:charter_payment).permit(:charter_id, :cantidad, :fecha)
    end
end
