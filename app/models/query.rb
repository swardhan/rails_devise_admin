class Query < ApplicationRecord
  has_one :user

  def user
  	User.find(self.user_id)
  end

end
