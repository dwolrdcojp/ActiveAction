class DowntimeCriterium < ApplicationRecord
  require 'CSV' 
  # Bulk upload downtime criteria
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      criteria_hash = DowntimeCriterium.new
      criteria_hash.shift       = row[0]
      criteria_hash.area        = row[1]
      criteria_hash.line        = row[2]
      criteria_hash.equipment   = row[3]
      criteria_hash.reason_code = row[4]

      criteria_hash.save
    end
  end

end

