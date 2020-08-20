class DowntimesController < ApplicationController
  before_action :set_downtime, only: [:show, :edit, :update, :destroy]

  # GET /downtimes
  # GET /downtimes.json
  def index
    @downtimes = Downtime.filter(params.slice(:date, :shift, :area, :line, :equipment, :reason_code)).order("id DESC").page params[:page]
    @downtime_chart_data = Downtime.filter(params.slice(:date, :shift, :area, :line, :equipment, :reason_code)).group_by_day(:date, format: "%m-%d").sum(:downtime)
    @downtime_pareto_by_min = Downtime.filter(params.slice(:date, :shift, :area, :line, :equipment, :reason_code)).group(:reason_code).sum(:downtime).sort_by { |x, y| y }.reverse
    @downtime_pareto_by_count = Downtime.filter(params.slice(:date, :shift, :area, :line, :equipment, :reason_code)).group(:reason_code).count.sort_by { |x, y| y }.reverse
  end

  # GET /downtimes/1
  # GET /downtimes/1.json
  def show
  end

  # GET /downtimes/new
  def new
    @downtime = Downtime.new
  end

  # GET /downtimes/1/edit
  def edit
  end

  # POST /downtimes
  # POST /downtimes.json
  def create
    @downtime = Downtime.new(downtime_params)

    respond_to do |format|
      if @downtime.save
        format.html { redirect_to @downtime, notice: 'Downtime was successfully created.' }
        format.json { render :show, status: :created, location: @downtime }
      else
        format.html { render :new }
        format.json { render json: @downtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /downtimes/1
  # PATCH/PUT /downtimes/1.json
  def update
    respond_to do |format|
      if @downtime.update(downtime_params)
        format.html { redirect_to @downtime, notice: 'Downtime was successfully updated.' }
        format.json { render :show, status: :ok, location: @downtime }
      else
        format.html { render :edit }
        format.json { render json: @downtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /downtimes/1
  # DELETE /downtimes/1.json
  def destroy
    @downtime.destroy
    respond_to do |format|
      format.html { redirect_to downtimes_url, notice: 'Downtime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_downtime
      @downtime = Downtime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def downtime_params
      params.require(:downtime).permit(:date, :shift, :area, :line, :equipment, :start_time, :stop_time, :downtime, :reason_code, :comment)
    end
end
