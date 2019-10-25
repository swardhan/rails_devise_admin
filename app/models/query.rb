class Query < ApplicationRecord
  has_one :user
  belongs_to :user
end
