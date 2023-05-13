class Admin::GiftsController < ApplicationController

  def index
    @gifts = Gift.page(params[:page]).per(10)
  end

  def show
    @gift = Gift.find(params[:id])
  end

end
