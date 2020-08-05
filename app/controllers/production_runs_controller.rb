class ProductionRunsController < ApplicationController
  def index
    @productionruns = ProductionRun.all
  end

  def show
    @productionrun = ProductionRun.find(params[:id])
  end

  def new
  end

  def create
    @productionrun = ProductionRun.new(production_run_params)
    @productionrun.date = Date.civil(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
    @productionrun.start_time = "#{params[:start_time][:hour]}#{params[:start_time][:minute]}"
    @productionrun.stop_time = "#{params[:stop_time][:hour]}#{params[:stop_time][:minute]}"
    @productionrun.save
    redirect_to @productionrun
  end

  private
    def production_run_params
      params.require(:productionrun).permit(:date, :line, :shift, :supervisor, :lead, :operator, :start_time, :stop_time)
    end
end
