class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def user_attributes=(username)
    raise username.inspect
      user = User.find_or_create_by(username) if username != ""
      self.user = user
  end
end
