class UsersController < ApplicationController

  def index 
    @user = User.all
  end

  def show 
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome #{@user.name} "
      redirect_to @user
    else
      flash[:error] = "Major fuck up !"
      render 'new'
    end
    
  end

end
