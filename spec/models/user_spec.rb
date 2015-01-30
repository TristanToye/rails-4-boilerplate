require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has a valid factory" do
  	expect(build(:user)).to be_valid
  end


  context "is invalid without" do
	  it "an email" do
	  	user = build(:user, email: nil)
	  	expect(user).to have(1).errors_on(:email)
	  end
	  it "a password" do
      user = build(:user, password: nil)
      expect(user).to have(1).errors_on(:password)
    end
  end

  context "has dependencies" do
    before :each do 
      @user = create(:user)
    end

    context "destroyed for it" do
    	it "identities" do
        create(:identity, user: @user)
        @user.destroy
        expect(Identity.find_by(user_id: @user.id)).to eq nil
      end
    end
  end
end