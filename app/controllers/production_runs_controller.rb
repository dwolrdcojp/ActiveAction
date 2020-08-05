class ProductionRunsController < ApplicationController
  
  def show
    @productionrun = ProductionRun.find(params[:id])
  end

  def new
  end

  def create
    @productionrun = ProductionRun.new(production_run_params)

    @productionrun.save
    redirect_to @productionrun
  end

  private
    def production_run_params
      params.require(:productionrun).permit(:date, :line, :shift, :supervisor, :lead, :operator, :starttime, :stoptime)
    end
end
