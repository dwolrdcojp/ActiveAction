class Comment < ApplicationRecord
  acts_as_tenant(:account)
  belongs_to :actionitem
end
