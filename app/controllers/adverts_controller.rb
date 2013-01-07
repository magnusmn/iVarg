class AdvertsController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_filter :signed_in_user, only: :new
  before_filter :correct_user, only: [ :show, :destroy ]

  def index
    @adverts = Advert.paginate(page: params[:page],
                               per_page: 10,
                               order: sort_column + " " + sort_direction)
  end

  def show
    @advert = Advert.find(params[:id])
  end

  def new
    @advert = Advert.new
  end

  def create
    @advert = current_user.adverts.build(params[:advert])
    if @advert.save
      flash[:success] = "Advert sucessfully created!"
      redirect_to @advert
    else
      render 'new'
    end
  end

  def destroy
    @advert.destroy
    flash[:success] = "Advert sucessfully deleted!"
    render 'show' 
  end

  private

    # Use find_by_id here to not raise an exception
    def correct_user
#      user = User.find_by_id(params[:id])
#      redirect_to(root_url) unless user && current_user?(user)
    end

    def sort_column
      Advert.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
    end
    def sort_direction
      %w[asc desc].include?(params[:dir]) ? params[:dir] : "desc"
    end
end
