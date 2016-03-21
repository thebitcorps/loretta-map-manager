class LotsController < ApplicationController
  before_action :set_lot, only: [:update]

  # GET /lots
  # GET /lots.json
  def index
    @lots = Lot.paginate(:page => params[:page], :per_page => 10, total_entries: Lot.count).order('id ASC')
  end

  # PATCH/PUT /lots/1
  # PATCH/PUT /lots/1.json
  def update
    respond_to do |format|
      if @lot.salesman_id != lot_params[:salesman_id]
        @lot.status = "reserved"
      end
      if @lot.update(lot_params)
        format.html { redirect_to @lot, notice: 'Lot was successfully updated.' }
        format.js {}
        format.json { render :show, status: :ok, location: @lot }
      else
        format.html { render :edit }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lot
      @lot = Lot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lot_params
      params.require(:lot).permit(:number, :block, :satage, :square_meters, :status, :salesman_id)
    end
end
