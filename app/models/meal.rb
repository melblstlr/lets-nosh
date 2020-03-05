# == Schema Information
#
# Table name: meals
#
#  id            :integer          not null, primary key
#  description   :string
#  image         :string
#  meal_name     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  creator_id    :integer
#  restaurant_id :integer
#

class Meal < ApplicationRecord

  def diet 
    diet_pair = DietaryGuidance.where({:meal_id => self.id}).pluck(:diet_id)
    return Diet.where({:id => diet_pair})
  end

  def creator
    return User.where({:id => self.creator_id}).at(0)
  end

  belongs_to :creator, :required => false, :class_name => "User"
  belongs_to :restaurant
  has_many :dietary_guidances, :dependent => :destroy

end
