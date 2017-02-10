# == Schema Information
#
# Table name: requests
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Request < ActiveRecord::Base
  belongs_to :user
end