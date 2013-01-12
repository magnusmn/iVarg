class UsersController < ApplicationController

  before_filter :_admin_user,   only: [ :index ]
  before_filter :correct_user, only: [ :destroy, :show ]

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @adverts = @user.adverts.paginate(page: params[:page],
                                      per_page: 10,
                                      order: sort_column + " " + sort_direction)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome #{@user.name}"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    u=User.find(params[:id]).destroy
    flash[:success] = "#{u.name} is sucessfully deleted."
    redirect_to users_url
  end

  private

    # Use find_by_id here to not raise an exception
    def correct_user
      @user = User.find_by_id(params[:id])
      redirect_to(root_url) unless @user && current_user?(@user) ||
                                            current_user.admin?
    end

    def _admin_user 
      redirect_to(root_url) unless admin_user?
    end
end
