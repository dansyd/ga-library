# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  isbn       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Favorite < ActiveRecord::Base
end
