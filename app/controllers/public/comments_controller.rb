class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!

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

  end

  def destroy
    Comment.find(params[:id]).destroy
    @gift = Gift.find(params[:gift_id])
    @comment = Comment.new
  end

  private
  def post_params
    params.require(:comment).permit(:body)
  end

end
