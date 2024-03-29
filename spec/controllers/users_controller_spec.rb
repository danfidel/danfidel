require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe UsersController do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # update the return value of this method accordingly.
  let(:valid_attributes){
    u = Factory.build(:user)
    u.attributes.merge('password' => u.password, 'password_confirmation' => u.password_confirmation)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all users as @users" do
      user = User.create! valid_attributes
      get :index, {}, valid_session
      assigns(:users).should eq([user])
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :edit, {:id => user.to_param}, valid_session
      assigns(:user).should eq(user)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        user = User.create! valid_attributes
        # Assuming there are no other users in the database, this
        # specifies that the User created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        User.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => user.to_param, :user => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested user as @user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        assigns(:user).should eq(user)
      end

      it "redirects to the user index" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        response.should redirect_to(users_url)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        user = User.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => user.to_param, :user => {}}, valid_session
        assigns(:user).should eq(user)
      end

      it "re-renders the 'edit' template" do
        user = User.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        User.any_instance.stub(:errors).and_return(ActiveModel::Errors.new(nil).tap { |errors| errors.add(:base, "error") })
        put :update, {:id => user.to_param, :user => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "GET test_password" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :test_password, {:user_id => user.to_param}, valid_session
      assigns(:user).should eq(user)
    end
  end

  describe "PUT authenticate" do
    describe "with valid password" do
      it "assigns the requested user as @user" do
        user = User.create! valid_attributes
        put :authenticate, {:user_id => user.to_param, :user => valid_attributes}, valid_session
        assigns(:user).should eq(user)
      end

      it "redirects to the user index" do
        user = User.create! valid_attributes
        put :authenticate, {:user_id => user.to_param, :user => valid_attributes}, valid_session
        response.should redirect_to(users_url)
      end
    end

    describe "with invalid password" do
      it "assigns the user as @user" do
        user = User.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:authenticate).and_return(false)
        put :authenticate, {:user_id => user.to_param, :user => {}}, valid_session
        assigns(:user).should eq(user)
      end

      it "re-renders the 'test_password' template" do
        user = User.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:authenticate).and_return(false)
        put :authenticate, {:user_id => user.to_param, :user => {}}, valid_session
        response.should render_template("test_password")
      end
    end
  end

end
