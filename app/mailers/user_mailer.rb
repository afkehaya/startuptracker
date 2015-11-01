class UserMailer < ActionMailer::Base
  default from: "no-reply@kehaya.com"
  default to: "alex@kehaya.com"

  def mandrill_client
  	@mandrill_client ||= Mandrill::API.new MANDRILL_API_KEY
  end

  def new_user(user)
  	@user = user
  	mail(subject: "New User: #{user.email}")
  end
end
