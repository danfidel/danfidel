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

  describe "#security_roles" do
    it "should return an array of the user's roles" do
      dut = Factory(:user, :producer => false, :director => false, :actor => false)
      Set[*dut.security_roles].should == Set[]

      dut = Factory(:user, :producer => false, :director => false, :actor => true)
      Set[*dut.security_roles].should == Set[:actor]

      dut = Factory(:user, :producer => false, :director => true,  :actor => false)
      Set[*dut.security_roles].should == Set[:director]

      dut = Factory(:user, :producer => false, :director => true,  :actor => true)
      Set[*dut.security_roles].should == Set[:director, :actor]

      dut = Factory(:user, :producer => true,  :director => false, :actor => false)
      Set[*dut.security_roles].should == Set[:producer]

      dut = Factory(:user, :producer => true,  :director => false, :actor => true)
      Set[*dut.security_roles].should == Set[:producer, :actor]

      dut = Factory(:user, :producer => true,  :director => true,  :actor => false)
      Set[*dut.security_roles].should == Set[:producer, :director]

      dut = Factory(:user, :producer => true,  :director => true,  :actor => true)
      Set[*dut.security_roles].should == Set[:producer, :director, :actor]
    end

    it "should return an empty array if the user has no roles" do
      Factory(:user, :producer => false, :director => false, :actor => false).security_roles.should be_empty
    end
  end
end
