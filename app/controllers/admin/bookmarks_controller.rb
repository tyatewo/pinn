class Admin::BookmarksController < ApplicationController

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
