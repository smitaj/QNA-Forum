class UserMailer < ActionMailer::Base

  def member_alert(email, qid)
    @email = email
    @question = qid
    mail(:to => @email, :from =>  "QNA-Forum<smita@ascratech.com>", :subject => "Mail From QNA Forum")
  end

end
