# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  admin           :boolean          default("false")
#  class           :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_many :reservations
  has_many :requests
end
