class ProductionHoursController < ApplicationController

  def create
    @productionrun = ProductionRun.find(params[:production_run_id])
    @production_hour = @productionrun.production_hours.create(production_hour_params)
    redirect_to production_run_path(@productionrun)
  end

  private
  def production_hour_params
    params.require(:production_hour).permit(:hour, :product, :plan_throughput, :actual_throughput, 
                                            :plan_labor, :actual_labor, :downtime, :waste, :rework, :yield)
  end
end
