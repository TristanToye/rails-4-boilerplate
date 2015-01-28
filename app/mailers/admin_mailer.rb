class AdminMailer < ActionMailer::Base
  default from: "#{APP_CONFIG['app_name']} <#{APP_CONFIG['default_email_address']}>"

  def send_support_request(to, from, message, is_user)

  	@to = to
  	@from = from
  	@message = message

  	if is_user
  		@is_user = "This is a registered user."
  	else
  		@is_user = "This is not one of our users."
  	end 

  	mail(to: @to, from: @from, subject: "Support Request - #{APP_CONFIG['app_name']}")
  end
end
