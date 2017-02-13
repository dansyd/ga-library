Book.destroy_all

book1 = Book.create :isbn => "9780984442577", :title => 'Responsive Web Design', :author => 'Ethan Marcotte', :publisher => 'A Book Apart', :date_published => '2011-06-06',:description => 'From mobile browsers to netbooks and tablets, users are visiting your sites from an increasing array of devices and browsers. Are your designs ready? Learn how to think beyond the desktop and craft beautiful designs that anticipate and respond to your users’ needs. Ethan Marcotte will explore CSS techniques and design principles, including fluid grids, flexible images, and media queries, demonstrating how you can deliver a quality experience to your users no matter how large (or small) their display.', :img_url => 'https://images.gr-assets.com/books/1291401033l/9815906.jpg', :status => 'available'

book2 = Book.create :isbn => "9781937557003", :title => 'Designing for Emotion', :author => 'Aarron Walter', :publisher => 'A Book Apart', :date_published => '2011-10-18', :description => 'Make your users fall in love with your site via the precepts packed into this brief, charming book by MailChimp user experience design lead Aarron Walter. From classic psychology to case studies, highbrow concepts to common sense, Designing for Emotion demonstrates accessible strategies and memorable methods to help you make a human connection through design.', :img_url => 'https://images.gr-assets.com/books/1318982331l/12910715.jpg', :status => 'available'

book3 = Book.create :isbn => "9781937557003", :title => 'Designing for Emotion', :author => 'Aarron Walter', :publisher => 'A Book Apart', :date_published => '2011-10-18', :description => 'Make your users fall in love with your site via the precepts packed into this brief, charming book by MailChimp user experience design lead Aarron Walter. From classic psychology to case studies, highbrow concepts to common sense, Designing for Emotion demonstrates accessible strategies and memorable methods to help you make a human connection through design.', :img_url => 'https://images.gr-assets.com/books/1318982331l/12910715.jpg', :status => 'available'

book4 = Book.create :isbn => "9780596101992", :title => 'JavaScript: The Definitive Guide', :author => 'David Flanagan', :publisher => "O'Reilly Media", :date_published => '2006-08-24', :description => "This Fifth Edition is completely revised and expanded to cover JavaScript as it is used in today's Web 2.0 applications. This book is both an example-driven programmer's guide and a keep-on-your-desk reference, with new chapters that explain everything you need to know to get the most out of JavaScript, including: Scripted HTTP and Ajax XML processing Client-side graphics using the canvas tag Namespaces in JavaScript--essential when writing complex programs Classes, closures, persistence, Flash, and JavaScript embedded in Java applications", :img_url => 'https://images.gr-assets.com/books/1347652925l/148050.jpg', :status => 'available'

book5 = Book.create :isbn => "9781937557003", :title => 'Designing for Emotion', :author => 'Aarron Walter', :publisher => 'A Book Apart', :date_published => '2011-10-18', :description => 'Make your users fall in love with your site via the precepts packed into this brief, charming book by MailChimp user experience design lead Aarron Walter. From classic psychology to case studies, highbrow concepts to common sense, Designing for Emotion demonstrates accessible strategies and memorable methods to help you make a human connection through design.', :img_url => 'https://images.gr-assets.com/books/1318982331l/12910715.jpg', :status => 'available'

book6 = Book.create :isbn => "4728473606124", :title => 'TEST BOOK, ONLY 1, AVAILABLE', :author => 'TEST BOOK', :publisher => 'TEST BOOK', :date_published => '2011-10-18', :description => 'THIS IS A TEST BOOK, YOU CAN EDIT ME AND DELETE ME. RERUN SEED TO RECREATE ME', :img_url => 'https://images.gr-assets.com/books/1318982331l/12910715.jpg', :status => 'available'

book7 = Book.create :isbn => "4728473686124", :title => 'TEST BOOK, ONLY 1, BORROWED', :author => 'TEST BOOK', :publisher => 'TEST BOOK', :date_published => '2011-10-18', :description => 'THIS IS A TEST BOOK, YOU CAN EDIT ME AND DELETE ME. RERUN SEED TO RECREATE ME', :img_url => 'https://images.gr-assets.com/books/1318982331l/12910715.jpg', :status => 'available'


User.destroy_all

user1 = User.create :name => 'Hayley Petrov', :admin => true, :course => 'staff', :email => 'hayley@ga.co', :password => 'chicken', :password_confirmation => 'chicken'

user2 = User.create :name => 'Daniel Ting', :admin => false, :course => 'WDI19', :email => 'dting@ga.co', :password => 'chicken', :password_confirmation => 'chicken'

user3 = User.create :name => 'Christle Lee', :admin => false, :course => 'WDI19', :email => 'clee@ga.co', :password => 'chicken', :password_confirmation => 'chicken'

user4 = User.create :name => 'Daniele Peviani', :admin => false, :course => 'WDI19', :email => 'dpeviani@ga.co', :password => 'chicken', :password_confirmation => 'chicken'


Reservation.destroy_all

# user2.reservations.create :book_id => book2.id, :date_requested => '2017-02-09', :date_borrowed => '2017-02-10', :date_due => '2017-02-20'
#
# user3.reservations.create :book_id => book3.id, :date_requested => '2017-02-10', :date_borrowed => '', :date_due => ''


Request.destroy_all

user4.requests.create :isbn => '9781491901946'
user2.requests.create :isbn => '9780596158002'
user3.requests.create :isbn => '9781933820248'

PendingItem.destroy_all
