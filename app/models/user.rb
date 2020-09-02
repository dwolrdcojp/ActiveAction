class User < ApplicationRecord
  acts_as_tenant(:account)
  belongs_to :account
  validates :email, :account_id, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
