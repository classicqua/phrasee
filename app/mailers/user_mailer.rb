class UserMailer < ActionMailer::Base
  # default from: "from@example.com"

  def email_name
    mail :subject => "Mandrill rides the Rails!",
         :to      => "to@yahoo.co.jp",
         :from    => "you@yourdomain.com"
  end
end
