
class BossMailer < ApplicationMailer
  default to: Proc.new { Boss.pluck(:email) },
          from: 'notification@example.com'
 
  def new_registration(user)
    @user = user
    mail(subject: "New User Signup: #{@user.email}")
  end
end