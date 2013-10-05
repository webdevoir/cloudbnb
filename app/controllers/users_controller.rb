class UsersController < ApplicationController

  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(params[:user])
    if params[:user][:email]
      @user.email = params[:user][:email].downcase
    end

    if @user.save
      login_current_user!
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors
      render :new
    end

  end

end
