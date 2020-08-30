class ProductionHour < ApplicationRecord
  acts_as_tenant(:account)
  belongs_to :production_run
end
