# == Schema Information
#
# Table name: books
#
#  id             :integer          not null, primary key
#  isbn           :integer
#  title          :string
#  author         :string
#  publisher      :string
#  date_published :date
#  description    :text
#  img_url        :string
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
