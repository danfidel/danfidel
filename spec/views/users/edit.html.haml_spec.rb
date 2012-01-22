require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :username => "MyString",
      :password_digest => "MyString",
      :producer => false,
      :director => false,
      :actor => false
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_password_digest", :name => "user[password_digest]"
      assert_select "input#user_producer", :name => "user[producer]"
      assert_select "input#user_director", :name => "user[director]"
      assert_select "input#user_actor", :name => "user[actor]"
    end
  end
end
