class ProductionHour < ApplicationRecord
  acts_as_tenant(:account)
  belongs_to :production_run

  def self.hour_calculations(production_hours)
    production_hours.map do |x|
      {hour: x.hour,
       product: x.product,
       plan_throughput: x.plan_throughput,
       actual_throughput: x.actual_throughput,
       tp_attainment: (x.actual_throughput / x.plan_throughput).round(3) * 100,
       plan_labor: x.plan_labor,
       actual_labor: x.actual_labor,
       plan_efficiency: (x.plan_throughput / x.plan_labor).round(2),
       actual_efficiency: (x.actual_throughput / x.actual_labor).round(2),
       eff_attainment: ((x.actual_throughput / x.actual_labor) / (x.plan_throughput / x.plan_labor)).round(3)  * 100,
       downtime: x.downtime,
       waste: x.waste,
       rework: x.rework,
       yield: x.yield}
    end
  end

  def self.total_calculations
    array = [
    plan_throughput = ProductionHour.sum(:plan_throughput),
    actual_throughput = ProductionHour.sum(:actual_throughput),
    tp_attainment = "#{(actual_throughput / plan_throughput).round(3) * 100}%",
    plan_labor = ProductionHour.sum(:plan_labor),
    actual_labor = ProductionHour.sum(:actual_labor),
    plan_efficiency = (plan_throughput / plan_labor).round(3) * 100,
    actual_effieciency = (actual_throughput / actual_labor).round(3) * 100,
    eff_attainment = "#{(actual_effieciency / plan_efficiency).round(3) * 100}%",
    downtime = ProductionHour.sum(:downtime),
    waste = ProductionHour.sum(:waste),
    rework = ProductionHour.sum(:rework),
    avg_yield = ProductionHour.average(:yield)]
  end
end
