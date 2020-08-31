class ProductionHour < ApplicationRecord
  acts_as_tenant(:account)
  belongs_to :production_run

  def self.hour_calculations(production_hours)
    production_hours.map do |x|
      {hour: x.hour,
       product: x.product,
       plan_throughput: x.plan_throughput,
       actual_throughput: x.actual_throughput,
       tp_attainment: (x.actual_throughput / x.plan_throughput).round(2) * 100,
       plan_labor: x.plan_labor,
       actual_labor: x.actual_labor,
       plan_efficiency: (x.plan_throughput / x.plan_labor).round(2),
       actual_efficiency: (x.actual_throughput / x.actual_labor).round(2),
       eff_attainment: ((x.actual_throughput / x.actual_labor) / (x.plan_throughput / x.plan_labor)).round(3)  * 100,
       downtime: x.downtime,
       waste: x.waste,
       rework: x.rework,
       yield: x.yield * 100}
    end
  end

  def self.total_calculations(production_hours)
    array = [
    plan_throughput = production_hours.sum(:plan_throughput).round(2),
    actual_throughput = production_hours.sum(:actual_throughput).round(2),
    tp_attainment = "#{ProductionHour.new.sanitize((actual_throughput / plan_throughput)) * 100}%",
    plan_labor = production_hours.sum(:plan_labor),
    actual_labor = production_hours.sum(:actual_labor).round(2),
    plan_efficiency = ProductionHour.new.sanitize((plan_throughput / plan_labor)),
    actual_effieciency = ProductionHour.new.sanitize((actual_throughput / actual_labor)),
    eff_attainment = "#{ProductionHour.new.sanitize((actual_effieciency / plan_efficiency rescue 0)) * 100}%",
    downtime = production_hours.sum(:downtime).round(2),
    waste = production_hours.sum(:waste).round(2),
    rework = production_hours.sum(:rework).round(2),
    avg_yield = "#{production_hours.average(:yield).to_f * 100}%"]
  end

  def sanitize(number)
    number.to_f.nan? ? 0 : number.round(2)
  end

end
