![logo](http://res.cloudinary.com/dt9ppmca8/image/upload/v1487289231/GA-library-black_wjmkkm.png)

Brought to you by [Daniel Ting](https://github.com/dting0104), [Christle Lee](https://github.com/wvyeun) and [Daniele Peviani](https://github.com/dansyd)

## About

Welcome to the GA Library. The idea was to create a website for the Sydney General Assembly newly opened book library. The admin staff is currently using Google spreadsheets to keep track of all the bookings and library stock, so as part of our group project we decided to help them and craft a web experience for students and librarian.  

[Live Demo](https://ga-library.herokuapp.com/)

## Features

* User Signin and Signup
* Reservations system
* Waitlist for reservations on unavailable books
* Requests for new books to be added to the library
* Admin Dashboard with ability to confirm/cancel all kinds of request
* Student Dashboard with reservations and borrow status
* Admin can add new books by entering ISBN   
* Email system sending reservation cancellation notifications and close to due date reminders

## Built With

**Web application framework**

* Rails 4.2.7.1
* Ruby 2.2.6

**Libraries, plugins and APIs**

* jQuery
* Slick carousel
* Algolia Search
* Google Books
* Good Reads (backup if book image not provided by Google Books)
* Sendgrid email system

**GEMS**

* Rails 12 Factor (Heroku deployment)
* Bcrypt (authentication)
* Algoliasearch-rails (advanced search)
* will_paginate (easy pagination)
* font-awesome-sass (font awesome icons integration)

## Known Issues, Bugs and improvements

* Responsive layout and carousel
* Dashboard performance
* Add new book from request
* Email confirmation
