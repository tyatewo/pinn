class Public::CommentsController < ApplicationController

  def show
    @gift = Gift.find(params[:id])
    @comments = @gift.comments
    @comment = Comment.new
  end

  def create
    @gift = Gift.find(params[:gift_id])
    @comment = Comment.new(post_params)
    @comment.customer_id = current_customer.id
    @comment.gift_id = params[:gift_id]
    @comment.save
    # if @comment.save
    #   redirect_to request.referer
    # else
    #   @gift = Gift.find(params[:gift_id])
    #   @comments = @gift.comments
    #   render gift_path(@gift)
    # end
  end

  def destroy
    # @comment = Comment.new(post_params)
    #@gift = Gift.find(params[:gift_id])
    Comment.find(params[:id]).destroy
    @gift = Gift.find(params[:gift_id])
    @comment = Comment.new
    # @gift = Gift.find(params[:gift_id])
    # @comments = @gift.comments
    # @comment = current_customer.comments.find_by(gift_id: @gift.id)
  end

  private
  def post_params
    params.require(:comment).permit(:body)
  end

end
