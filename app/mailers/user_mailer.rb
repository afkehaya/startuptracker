class UserMailer < ActionMailer::Base
  default from: "no-reply@concept-21.com"
  default to: "alex@concept-21.com"

  def mandrill_client
  	@mandrill_client ||= Mandrill::API.new MANDRILL_API_KEY
  end

  def new_user(user)
  	@user = user
  	mail(subject: "New User: #{user.email}")
  end
end
