require 'rails_helper'

RSpec.describe GlobalConfig, :type => :model do
  it "has a valid factory" do
  	config = build(:global_config)
  	expect(config).to be_valid
  end
end
