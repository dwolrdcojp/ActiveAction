class ProductionRun < ApplicationRecord
  validates :date, :line, :shift, :supervisor, :lead, 
            :operator, :start_time, :stop_time, presence: true

end
