require 'rails_helper'

RSpec.describe Identity, :type => :model do
  it "has a valid factory" do
  	expect(build(:identity)).to be_valid
  end
  it "is associated with a user" do
  	expect(build(:identity).user).to be_valid
  end
  it "is invalid without a user_id" do
  	expect(build(:identity, user_id: nil)).to have(1).errors_on(:user_id)
  end
  it "is invalid without a provider" do
  	expect(build(:identity, provider: nil)).to have(1).errors_on(:provider)
  end
  it "is invalid without a uid" do
  	expect(build(:identity, uid: nil)).to have(1).errors_on(:uid)
  end
end