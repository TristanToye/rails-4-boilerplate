class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def self.provides_callback_for(provider)
		class_eval %Q{
			def #{provider}
				@user = User.find_for_oauth(env["omniauth.auth"], current_user)

				if @user.persisted?
					sign_in_and_redirect @user, event: :authentication
					set_flash)message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
				else
					sesson["devise.#{provider}_data"] = env["omniauth.auth]
					redirect_to new_user_registration_url
				end
			end
		}
	end

	[:twitter, :facebook, :linkedin].each do |provider|
		providers_callback_for provider
	end

	def after_sign_in_path_for(resource)
		if resource.email_verified?
			super resource
		else
			finish_signup_path(resource)
		end
	end
end