class DowntimesController < ApplicationController
  before_action :set_downtime, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /downtimes
  # GET /downtimes.json
  def index
    filtered_downtime = Downtime.filter(params.slice(:date, :shift, :area, :line, :equipment, :reason_code))

    @downtimes = filtered_downtime.order("id DESC").page params[:page]
    @downtime_data_daily = filtered_downtime.group_by_day(:date, last: 14, format: "%m-%d").sum(:downtime)
    @downtime_data_weekly = filtered_downtime.group_by_week(:date, last: 14, format: "%-m-%-d", week_start: :saturday, time_zone: false).sum(:downtime)
    @downtime_pareto_by_min = filtered_downtime.group(:reason_code).sum(:downtime).sort_by { |x, y| y }.reverse[0..9]
    @downtime_pareto_by_count = filtered_downtime.group(:reason_code).count.sort_by { |x, y| y }.reverse[0..9]
    @equipment_pareto_by_min = filtered_downtime.group(:equipment).sum(:downtime).sort_by { |x, y| y }.reverse[0..9]
    @equipment_pareto_by_count = filtered_downtime.group(:equipment).count.sort_by { |x, y| y }.reverse[0..9]
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

    def filtering_params(params)
      params.slice(:date, :shift, :area, :line, :equipment, :reason_code)
    end
end
