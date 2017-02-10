# == Schema Information
#
# Table name: reservations
#
#  id             :integer          not null, primary key
#  book_id        :integer
#  user_id        :integer
#  date_requested :date
#  date_borrowed  :date
#  date_due       :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
