class UsersController < ApplicationController

  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    #create a new user with all data received from form (in params)
    @user = User.new(params[:user])
    #once @user is defined properly, calling @user.save is all that’s needed to complete the registration
    if @user.save
        #Handle a successful save.
        flash[:success] = "Registration Successful!"
        redirect_to root_path
    else
    #re-render the signup page if invalid signup data is received.
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
  end

  def destroy
  end
  
end
