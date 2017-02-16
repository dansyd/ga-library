class UserMailerPreview < ActionMailer::Preview
  def book_now_available
    UserMailer.book_now_available(User.second.id, Book.first)
  end
end
