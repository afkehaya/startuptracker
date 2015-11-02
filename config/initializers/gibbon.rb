MAILCHIMP_API_KEY = ENV["MAILCHIMP_KEY"]
Gibbon::Request.api_key = MAILCHIMP_API_KEY
Gibbon::Request.timeout = 15
Gibbon::Request.throws_exceptions = false



