class UserMailer < ApplicationMailer

  def book_now_available(user_id, book)
    @user = User.find user_id
    @book = book
    mail :to => @user.email, :subject => 'The book you reserved is now available', :cc => 'daniele.peviani@gmail.com'
  end

  def one_day_till_due(user, book)
    @user = user
    @book = book
    mail :to => @user.email, :subject => 'The book you borrowed is due tomorrow', :cc => 'daniele.peviani@gmail.com'
  end

  def reservation_cancelled(user, book)
    @user = user
    @book = book
    mail :to => @user.email, :subject => 'There is a problem with one of your reservations', :cc => 'daniele.peviani@gmail.com'
  end

end
