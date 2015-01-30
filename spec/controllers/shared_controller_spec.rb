require 'rails_helper'

RSpec.describe SharedController, :type => :controller do
	before :each do
		@admin_user = create(:admin_user)
		sign_in :user, @admin_user
	end

	describe "GET #index" do
		it "redirects if a user is signed in and confirmed" do
			sign_in :user, create(:user, confirmed_at: Date.today)
			get :index
			expect(response).to redirect_to(dashboard_users_path)
		end
	end

	describe "POST send_support_request" do
		
	end
end