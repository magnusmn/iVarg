class UsersController < ApplicationController
  before_filter :admin_user,   only: [ :index, :show ]
  before_filter :correct_user, only: [ :destroy, :show ]

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @adverts = @user.adverts.paginate(page: params[:page],
                                      per_page: 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome #{@user.name} "
      sign_in @user
      redirect_to @user
    else
      #flash.now[:error] = "Major fuck up !"
      render 'new'
    end
  end

  private

    # Use find_by_id here to not raise an exception
    def correct_user
      @user = User.find_by_id(params[:id])
      redirect_to(root_url) unless @user && current_user?(@user) || current_user.admin?
    end

    def admin_user 
      redirect_to(root_url) unless current_user && current_user.admin? 
    end
end
