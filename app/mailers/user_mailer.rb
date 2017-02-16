class UserMailer < ApplicationMailer

  def book_now_available(user_id, book)
    @user = User.find user_id
    @book = book
    mail :to => @user.email, :subject => 'The book you reserved is now available', :cc => 'daniele.peviani@gmail.com'
  end

end
