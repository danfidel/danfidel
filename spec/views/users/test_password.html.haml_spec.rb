require 'spec_helper'

describe "users/test_password" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :username => "MyString",
      :password_digest => "MyString"
    ))
  end

  it "renders the test password form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_authenticate_path(@user), :method => "get" do
      assert_select "input#user_password", :name => "user[password]"
    end
  end
end
