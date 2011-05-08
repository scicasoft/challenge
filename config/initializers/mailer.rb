ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :address        => "smtp.alwaysdata.com",
  :port           => 25,
  :user_name      => "challenge@scicasoft.com",
  :password       => "challengepass",
  :authentication => :plain
}