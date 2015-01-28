# This Controller is for all shared pages for the app - landing pages, about, terms of use, etc.

class SharedController < ApplicationController
	def index
		
	end

	# From Popup Support Form
	def send_support_request
		require 'slack-poster'

		message = params[:message]
		if current_user
			from = current_user.email
			is_user = 'is a current user'
		else
			from = params[:email]
			is_user = 'is not a current user'
		end

		# Check Type of Request
	  case params[:message_type]
	  when 'technical'
	  	to 			= APP_CONFIG["technical_support_email"]
	  	channel = APP_CONFIG["technical_slack_channel"]
	  when 'feedback'
	  	to 			= APP_CONFIG["feedback_support_email"]
	  	channel = APP_CONFIG["feedback_slack_channel"]
	  else
	  	to 			= APP_CONFIG["default_email_address"]
	  	channel = APP_CONFIG["default_slack_channel"]
	  end

		# Email Appropriate Contact
		AdminMailer.send_support_request(to, from, message, is_user).deliver

		# Send Notification to Slack About Request
		if APP_CONFIG["use_slack"]
			
			options = {
				icon_url: APP_CONFIG["slack_icon_url"],
				username: APP_CONFIG["slack_user"],
				channel: channel
			}
			# Create new poster
			poster = Slack::Poster.new(APP_CONFIG["slack_team"], ENV["SLACK_TOKEN"], options)
			# Prepare message
			slack_message = "#{from} says: #{message} - #{from} #{is_user}"
			# Send slack notification
			poster.send_message(slack_message)
		end

		redirect_to :back, notice: "Message sent to our team!"
	end

end
