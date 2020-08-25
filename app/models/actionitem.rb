class Actionitem < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :focus, :description, :owner, :due, :urgency, 
            :importance, :status, :priority, presence: true
  scope :filter_by_id, -> (id) { where id: id }
  scope :filter_by_focus, -> (focus) { where focus: focus }
  scope :filter_by_owner, -> (owner) { where owner: owner }
  scope :filter_by_due, -> (due) { where due: due }
  scope :filter_by_priority, -> (priority) { where priority: priority }
  scope :filter_by_status, -> (status) { where status: status }
  include Filterable

  def self.count_past_due
    dates = pluck(:due, :status)
    dates.count{ |x, y| x < Date.today() && y != "Completed" }
  end

  def self.find_past_due
    action_values = pluck(:id, :due, :status)
    past_due = action_values.select { |x, y, z| y < Date.today() && z != "Completed" }
    past_due_ids = past_due.map { |x, y, z| x }
  end

end