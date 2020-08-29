class ProductionRun < ApplicationRecord
  has_many :production_hours
  validates :date, :shift, :area, :line, :supervisor, :lead, 
            :operator, :start_time, presence: true
  scope :filter_by_date, -> (date) { where date: date }
  scope :filter_by_area, -> (area) { where area: area }
  scope :filter_by_line, -> (line) { where line: line }
  scope :filter_by_shift, -> (shift) { where shift: shift }
  scope :filter_by_supervisor, -> (supervisor) { where supervisor: supervisor }
  include Filterable
end
