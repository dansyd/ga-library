class UserMailerPreview < ActionMailer::Preview
  def book_now_available
    UserMailer.book_now_available(User.second.id, Book.first)
  end

  def one_day_till_due
    UserMailer.one_day_till_due(User.second, Book.first)
  end
end
