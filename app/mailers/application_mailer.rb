class ApplicationMailer < ActionMailer::Base
  default :from => 'daniele.peviani@gmail.com' #REPLACE WITH ADMIN USER EMAIL?
  layout 'ga_mail_boilerplate'
end
