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

class Book < ActiveRecord::Base
  has_many :reservation
end
