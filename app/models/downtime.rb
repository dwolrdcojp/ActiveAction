class Downtime < ApplicationRecord
  validates :date, :shift, :area, :line, :equipment, :start_time, 
            :downtime, :reason_code, presence: true
  scope :filter_by_date, -> (date) { where date: date }
  scope :filter_by_shift, -> (shift) { where shift: shift }
  scope :filter_by_area, -> (area) { where area: area }
  scope :filter_by_line, -> (line) { where line: line }
  scope :filter_by_equipment, -> (equipment) { where equipment: equipment }
  scope :filter_by_reason_code, -> (reason_code) { where reason_code: reason_code }
  include Filterable
end
