class ChartersController < ApplicationController
  before_action :set_charter, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /charters
  # GET /charters.json
  def index
    @charters = Charter.all
  end

  # GET /charters/1
  # GET /charters/1.json
  def show
  end

  # GET /charters/new
  def new
    @charter = Charter.new
  end

  # GET /charters/1/edit
  def edit
  end

  # POST /charters
  # POST /charters.json
  def create
    @charter = Charter.new(charter_params)
    @charter.user_id = current_user.id

    respond_to do |format|
      if @charter.save
        format.html { redirect_to @charter, notice: 'Charter was successfully created.' }
        format.json { render :show, status: :created, location: @charter }
      else
        format.html { render :new }
        format.json { render json: @charter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charters/1
  # PATCH/PUT /charters/1.json
  def update
    respond_to do |format|
      if @charter.update(charter_params)
        format.html { redirect_to @charter, notice: 'Charter was successfully updated.' }
        format.json { render :show, status: :ok, location: @charter }
      else
        format.html { render :edit }
        format.json { render json: @charter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charters/1
  # DELETE /charters/1.json
  def destroy
    @charter.destroy
    respond_to do |format|
      format.html { redirect_to charters_url, notice: 'Charter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charter
      @charter = Charter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charter_params
      params.require(:charter).permit(:user_id, :alias, :rfc, :razon_social, :direccion, :encargado, :telefono_encargado, :correo_encargado, :codigo_fletera)
    end
end
