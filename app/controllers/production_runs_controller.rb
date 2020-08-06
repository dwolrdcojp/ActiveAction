class ProductionRunsController < ApplicationController

  def index
    @productionruns = ProductionRun.all.sort.reverse
  end

  def show
    @productionrun = ProductionRun.find(params[:id])
  end

  def new
    @productionrun = ProductionRun.new
  end

  def edit
    @productionrun = ProductionRun.find(params[:id])
  end

  def create
    @productionrun = ProductionRun.new(production_run_params)
    @productionrun.date = Date.civil(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
    @productionrun.start_time = "#{params[:start_time][:hour]}#{params[:start_time][:minute]}"
    @productionrun.stop_time = "#{params[:stop_time][:hour]}#{params[:stop_time][:minute]}"
    
    if @productionrun.save
      redirect_to @productionrun
    else
      render 'new'
    end
  end

  def update
    @productionrun = ProductionRun.find(params[:id])
    @productionrun.date = Date.civil(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
    @productionrun.start_time = "#{params[:start_time][:hour]}#{params[:start_time][:minute]}"
    @productionrun.stop_time = "#{params[:stop_time][:hour]}#{params[:stop_time][:minute]}"

    if @productionrun.update(production_run_params)
      redirect_to @productionrun
    else
      render 'edit'
    end
  end

  def destroy
    @productionrun = ProductionRun.find(params[:id])
    @productionrun.destroy

    redirect_to production_runs_path
  end

  private
    def production_run_params
      params.require(:production_run).permit(:date, :line, :shift, :supervisor, :lead, :operator, :start_time, :stop_time)
    end
end
