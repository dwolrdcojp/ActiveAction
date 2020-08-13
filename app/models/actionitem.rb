class Actionitem < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :focus, :description, :owner, :due, :urgency, 
            :importance, :status, :priority, presence: true
  scope :filter_by_focus, -> (focus) { where focus: focus }
  scope :filter_by_owner, -> (owner) { where owner: owner }
  scope :filter_by_due, -> (due) { where due: due }
  scope :filter_by_priority, -> (priority) { where priority: priority }
  scope :filter_by_status, -> (status) { where status: status }
  include Filterable
end