class Actionitem < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :focus, :description, :owner, :due, :urgency, 
            :importance, :status, :priority, presence: true

end