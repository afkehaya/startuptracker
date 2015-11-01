
MANDRIL_API_KEY = "PJheBQ5hVPRI5w2Fy5ouNQ"
ActionMailer::Base.smtp_settings = {
	address: "smtp.mandrillapp.com",
	port: 587,
	enable_starttls_auto: true,
	user_name: "alex@kehaya.com",
	password: MANDRIL_API_KEY,
	authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default cahrset: "utf-8"