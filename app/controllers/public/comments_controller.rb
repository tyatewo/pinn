class Public::CommentsController < ApplicationController

  def show
    @gift = Gift.find(params[:id])
    @comments = @gift.comments
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(post_params)
    @comment.customer_id = current_customer.id
    @comment.gift_id = params[:gift_id]
    if @comment.save
      redirect_to request.referer
    else
      @gift = Gift.find(params[:gift_id])
      @comments = @gift.comments
      render gift_path(@gift)
    end
  end

  private
  def post_params
    params.require(:comment).permit(:body)
  end

end
