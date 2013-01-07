class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_filter :admin_user,   only: [ :index ]
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
      sign_in @user
      flash[:success] = "Welcome #{@user.name}"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    # Use find_by_id here to not raise an exception
    def correct_user
      @user = User.find_by_id(params[:id])
      redirect_to(root_url) unless @user && current_user?(@user) ||
                                            current_user.admin?
    end

    def admin_user 
      redirect_to(root_url) unless current_user && current_user.admin? 
    end

    def sort_column
      Advert.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
    end
    def sort_direction
      %w[asc desc].include?(params[:dir]) ? params[:dir] : "desc"
    end
end
