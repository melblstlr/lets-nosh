# == Schema Information
#
# Table name: diets
#
#  id               :integer          not null, primary key
#  diet_description :string
#  diet_name        :string
#  website_link     :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Diet < ApplicationRecord


has_many :dietary_guidances, :dependent => :destroy

end
