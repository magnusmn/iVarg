class AdvertsController < ApplicationController

  def index
    @adverts = Advert.paginate(page: params[:page], per_page: 10)
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
      #flash.now[:error] = "Major fuck up !"
      render 'new'
    end
    
  end
end
