class ProductionHoursController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @productionrun = ProductionRun.find(params[:production_run_id])
    @production_hour = @productionrun.production_hours.create(production_hour_params)
    redirect_to production_run_path(@productionrun)
  end

  def edit
    @productionrun = ProductionRun.find(params[:production_run_id])
    @production_hour = @productionrun.production_hours.find(params[:id])
  end

  def destroy
    @productionrun = ProductionRun.find(params[:production_run_id])
    @production_hour = @productionrun.production_hours.find(params[:id])
    @production_hour.destroy
    redirect_to production_run_path(@productionrun)
  end

  def update
    @productionrun = ProductionRun.find(params[:production_run_id])
    @production_hour = @productionrun.production_hours.find(params[:id])

    if @production_hour.update(production_hour_params)
      redirect_to @productionrun
    else
      render 'edit'
    end
  end

  private
  def production_hour_params
    params.require(:production_hour).permit(:hour, :product, :plan_throughput, :actual_throughput, 
                                            :plan_labor, :actual_labor, :downtime, :waste, :rework, :yield)
  end
end
