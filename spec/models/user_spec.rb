require 'spec_helper'

describe User do
  let(:user) { Factory(:user) }

  it {
    neededForShoulda = Factory(:user)
    should validate_uniqueness_of(:username)
  }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }

  it "should be valid from the factory" do
    user.should be_valid
  end
end
