class AdvertsController < ApplicationController

  def index 
    @advert = Advert.all
  end

  def show 
    @advert = Advert.find(params[:id])
  end

  def new
    @advert = Advert.new
  end

  def create
    @advert = Advert.new(params[:advert])
    if @advert.save
      flash[:success] = "Advert sucessfully created!"
      redirect_to @advert
    else
      flash.now[:error] = "Major fuck up !"
      render 'new'
    end
    
  end
end
