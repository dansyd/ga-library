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
  has_many :borrowed_books, -> { where status: 'borrowed' }, :through => :reservations, :source => :book
  has_many :pending_items


  has_secure_password
  validates :email, :presence => true, :uniqueness => true

  def has_reserved_this(isbn)
    self.reserved_books.where({isbn: isbn}).exists? || self.pending_items.where({isbn: isbn}).exists?
  end

  def has_borrowed_this(isbn)
    self.borrowed_books.pluck('isbn').include?(isbn)
  end

end
