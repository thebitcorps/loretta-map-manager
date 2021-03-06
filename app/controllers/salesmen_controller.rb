class SalesmenController < ApplicationController
  before_action :authenticate_user!
  before_action :set_salesman, only: [:edit, :update, :destroy]

  # GET /salesmen
  # GET /salesmen.json
  def index
    @salesmen = Salesman.all
  end

  # GET /salesmen/new
  def new
    @salesman = Salesman.new
  end

  # GET /salesmen/1/edit
  def edit
  end

  # POST /salesmen
  # POST /salesmen.json
  def create
    @salesman = Salesman.new(salesman_params)

    respond_to do |format|
      if @salesman.save
        format.html { redirect_to salesmen_path, notice: 'Nuevo vendedor creado correctamente.' }
        format.json { render :show, status: :created, location: @salesman }
      else
        format.html { render :new }
        format.json { render json: @salesman.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salesmen/1
  # PATCH/PUT /salesmen/1.json
  def update
    respond_to do |format|
      if @salesman.update(salesman_params)
        format.html { redirect_to salesmen_path, notice: 'Vendedor actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @salesman }
      else
        format.html { render :edit }
        format.json { render json: @salesman.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salesmen/1
  # DELETE /salesmen/1.json
  def destroy
    @salesman.lots.update_all status: "available" if @salesman.lots.any?
    @salesman.destroy
    respond_to do |format|
      format.html { redirect_to salesmen_url, notice: 'Salesman was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salesman
      @salesman = Salesman.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salesman_params
      params.require(:salesman).permit(:name, :lastname)
    end
end
