# == Schema Information
#
# Table name: pending_items
#
#  id             :integer          not null, primary key
#  isbn           :string
#  user_id        :integer
#  date_requested :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class PendingItem < ActiveRecord::Base
  belongs_to :user
end
