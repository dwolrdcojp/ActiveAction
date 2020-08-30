class DowntimeCriteriaController < ApplicationController
  before_action :set_downtime_criterium, only: [:show, :edit, :update, :destroy]

  # GET /downtime_criteria
  # GET /downtime_criteria.json
  def index
    @downtime_criteria = DowntimeCriterium.all
  end

  # GET /downtime_criteria/1
  # GET /downtime_criteria/1.json
  def show
  end

  # GET /downtime_criteria/new
  def new
    @downtime_criterium = DowntimeCriterium.new
  end

  # GET /downtime_criteria/1/edit
  def edit
  end

  # POST /downtime_criteria
  # POST /downtime_criteria.json
  def create
    @downtime_criterium = DowntimeCriterium.new(downtime_criterium_params)

    if params[:downtime_criterium].blank?
      DowntimeCriterium.import(params[:downtime_criterium][:file])
      flash[:notice] = "Downtime criteria uploaded successfully"
    else
      nil
    end
       
    respond_to do |format|
      if @downtime_criterium.save
        format.html { redirect_to downtimes_path, notice: 'Downtime criterium was successfully created.' }
        format.json { render :show, status: :created, location: @downtime_criterium }
      else
        format.html { render :new }
        format.json { render json: @downtime_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /downtime_criteria/1
  # PATCH/PUT /downtime_criteria/1.json
  def update
    respond_to do |format|
      if @downtime_criterium.update(downtime_criterium_params)
        format.html { redirect_to @downtime_criterium, notice: 'Downtime criterium was successfully updated.' }
        format.json { render :show, status: :ok, location: @downtime_criterium }
      else
        format.html { render :edit }
        format.json { render json: @downtime_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /downtime_criteria/1
  # DELETE /downtime_criteria/1.json
  def destroy
    @downtime_criterium.destroy
    respond_to do |format|
      format.html { redirect_to downtime_criteria_url, notice: 'Downtime criterium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_downtime_criterium
      @downtime_criterium = DowntimeCriterium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def downtime_criterium_params
      params.require(:downtime_criterium).permit(:shift, :area, :line, :equipment, :reason_code)
    end
end
