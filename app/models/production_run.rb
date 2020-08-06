class ProductionRun < ApplicationRecord
  has_many :production_hours
  validates :date, :line, :shift, :supervisor, :lead, 
            :operator, :start_time, :stop_time, presence: true

end
