# == Schema Information
#
# Table name: dietary_guidances
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  diet_id    :integer
#  meal_id    :integer
#

class DietaryGuidance < ApplicationRecord


  belongs_to :meal
  belongs_to :diet
end
