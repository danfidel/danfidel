class UsersController < ApplicationController
  respond_to :html
  
  def index
    @users = User.all
    respond_with(@users)
  end

  def edit
    @user = User.find(params[:id])
    respond_with(@user)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
    end
    respond_with(@user, :location => users_url)
  end

  def test_password
    @user = User.find(params[:user_id])
    respond_with(@user)
  end

  def authenticate
    @user = User.find(params[:user_id])
    password = (params[:user] || {})[:password]

    respond_to do |format|
      if @user.authenticate(password)
        format.html { redirect_to users_url, :notice => 'Password is authentic.' }
      else
        @user.errors.add :base, "Password is invalid"
        format.html { render :action => "test_password" }
      end
    end
  end
end
