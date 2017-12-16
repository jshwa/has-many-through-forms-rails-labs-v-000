class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def user_attributes=(user_attributes)
    user_attributes.each do |user_attribute|
      binding.pry
      user = User.find_or_create_by(user_attribute) if user_attribute[1] != ""
      self.user = user
    end
  end
end
