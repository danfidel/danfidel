require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :username => "Username",
        :password_digest => "Password Digest",
        :producer => true,
        :director => false,
        :actor => false
      ),
      stub_model(User,
        :username => "Username",
        :password_digest => "Password Digest",
        :producer => false,
        :director => true,
        :actor => false
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 4
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => true.to_s, :count => 2
  end
end
