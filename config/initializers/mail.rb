
MANDRIL_API_KEY = "YWjrm5v9NMdbZHKKL1iTFA"
ActionMailer::Base.smtp_settings = {
	address: "smtp.mandrillapp.com",
	port: 587,
	enable_starttls_auto: true,
	user_name: "alex@concept-21.com",
	password: MANDRIL_API_KEY,
	authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default cahrset: "utf-8"