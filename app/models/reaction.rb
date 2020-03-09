# == Schema Information
#
# Table name: reactions
#
#  id         :integer          not null, primary key
#  reaction   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  meal_id    :integer
#  user_id    :integer
#

class Reaction < ApplicationRecord




belongs_to :user
belongs_to :meal
end
