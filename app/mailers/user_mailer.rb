class UserMailer < ActionMailer::Base
  # default from: "from@example.com"

  def email_name
    mail :subject => "Mandrill rides the Rails!",
         :to      => "bossp-0424-test@yahoo.co.jp",
         :from    => "you@yourdomain.com"
  end
end
