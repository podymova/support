class MessagesMailer < ActionMailer::Base
  default from: "support.local:3000"

  def bug_email(user)
    @user = user
    @url  = user.email
    mail(:to => 'ivinstar@narod.ru', :subject => "Support: Bug information")
  end
end
