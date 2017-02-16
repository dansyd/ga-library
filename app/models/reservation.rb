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

class Reservation < ActiveRecord::Base
  belongs_to :book
  belongs_to :user


  def self.check_for_due_dates
    borrowed_books = Book.where({status: 'Borrowed'})
    borrowed_books.each do |book|
      book.reservations.each do |reservation|
        if reservation.date_due == Date.today + 10
          user = User.find reservation.user_id
          UserMailer.one_day_till_due(user, book).deliver_now
        end
      end
    end
  end

end
