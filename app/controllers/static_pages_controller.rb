class StaticPagesController < ApplicationController
  def home
  end

  def help
    logger.info "Help!!"
  end
end
