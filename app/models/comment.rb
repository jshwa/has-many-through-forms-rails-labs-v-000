class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def user_attributes=(username)
      user = User.find_or_create_by(username) if username[:username] != ""
      self.user = user
  end
end
