class Actionitem < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :focus, presence: true,
                    length: { minimum: 5 }

end
