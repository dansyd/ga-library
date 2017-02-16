desc "This task is called by the Heroku scheduler add-on and checks for soon to be overdue books"
task :one_day_till_due => :environment do
  Reservation.check_for_due_dates
end
