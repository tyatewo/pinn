class Admin::BookmarksController < ApplicationController
  before_action :authenticate_admin!

  def create
    @gift = Gift.find(params[:gift_id])
    bookmark = current_customer.bookmarks.new(gift_id: @gift.id)
    bookmark.save
  end

  def destroy
    @gift = Gift.find(params[:gift_id])
    bookmark = current_customer.bookmarks.find_by(gift_id: @gift.id)
    bookmark.destroy
  end

end
