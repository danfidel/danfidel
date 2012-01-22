class UsersController < ApplicationController
  respond_to :html
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to '#index', :notice => 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
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
        format.html { redirect_to '#index', :notice => 'Password is authentic.' }
        format.json { head :ok }
      else
        @user.errors.add :base, "Password is invalid"
        format.html { render :action => "test_password" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end
