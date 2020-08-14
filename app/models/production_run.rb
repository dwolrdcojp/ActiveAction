class ProductionRun < ApplicationRecord
  has_many :production_hours
  validates :date, :line, :shift, :supervisor, :lead, 
            :operator, :start_time, :stop_time, presence: true
  scope :filter_by_date, -> (date) { where date: date }
  scope :filter_by_line, -> (line) { where line: line }
  scope :filter_by_shift, -> (shift) { where shift: shift }
  scope :filter_by_supervisor, -> (supervisor) { where supervisor: supervisor }
  include Filterable
end
