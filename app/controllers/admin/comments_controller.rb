class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @gift = Gift.find(params[:id])
    @comments = @gift.comments
    @comment = Comment.new
  end


  def destroy
    # @comment = Comment.new(post_params)
    #@gift = Gift.find(params[:gift_id])
    Comment.find(params[:id]).destroy
    @gift = Gift.find(params[:gift_id])
    flash[:notice] = "削除が完了しました。"
    # @gift = Gift.find(params[:gift_id])
    # @comments = @gift.comments
    # @comment = current_customer.comments.find_by(gift_id: @gift.id)
  end

  private
  def post_params
    params.require(:comment).permit(:body)
  end

end
