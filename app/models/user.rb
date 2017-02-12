# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  admin           :boolean          default(FALSE)
#  course          :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_many :reservations
  has_many :requests
  has_many :reserved_books, :through => :reservations, :source => :book

  has_secure_password
  validates :email, :presence => true, :uniqueness => true

  def borrowed_books
    reservations.map do |r|
      [r.book.title, r.date_due]
    end
  end

  def submitted_requests
    requests.map do |r|
      [r.id, $gr_client.book_by_isbn(r.isbn).title]
    end
  end
end
