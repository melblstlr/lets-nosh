# == Schema Information
#
# Table name: restaurants
#
#  id              :integer          not null, primary key
#  address         :string
#  chain           :boolean
#  image           :string
#  restaurant_name :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Restaurant < ApplicationRecord

def meal 
  return Meal.where({:restaurant_id => self.id})
end 

def diet 
  guidance = DietaryGuidance.where({:meal_id => self.meal.pluck(:id)})
  return Diet.where({:id => guidance.pluck(:diet_id)})
end 


  has_many :meals, :dependent => :destroy
end
