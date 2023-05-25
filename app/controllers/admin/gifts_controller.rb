class Admin::GiftsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:search]
      @gifts = Gift.where('name LIKE ?', "%#{params[:search]}%").page(params[:page]).per(12)
    elsif params[:tag_id]
      @gifts = Tag.find(params[:tag_id]).gifts.page(params[:page]).per(12)
    elsif params[:scene_id]
      @gifts = Scene.find(params[:scene_id]).gifts.page(params[:page]).per(12)
    elsif params[:latest]
      @gifts = Gift.latest.page(params[:page]).per(12)
    elsif params[:old]
      @gifts = Gift.old.page(params[:page]).per(12)
    elsif params[:bookmark_count]
      @gifts = Gift.includes(:bookmarks).sort {|a,b| b.bookmarks.size <=> a.bookmarks.size}
      @gifts = Kaminari.paginate_array(@gifts).page(params[:page]).per(12)
    else
      @gifts = Gift.order(id: "DESC").page(params[:page]).per(12)
    end

      @scenes = Scene.all
      @tag_list = Tag.all
  end

  def show
    @gift = Gift.find(params[:id])
    @comment = Comment.new
    @comments = @gift.comments
    @tag_list = @gift.tags
  end

  def search_tag
    @gifts = Gift.all
    @gift = Gift.find(params[:gift_id])
    @tag_list=Tag.all #検索結果画面でもタグ一覧表示
    @tag=Tag.find(params[:tag_id]) #検索されたタグを受け取る
    @gift_tags=@tag.gifts.page(params[:page]).per(12) #検索されたタグに紐づく投稿を表示
  end


  def search
    @gifts = Gift.search(params[:search]) #Viewのformで取得したパラメータをモデルに渡す
  end

  def destroy
    @gift = Gift.find(params[:id])
    @gift.destroy
    flash[:notice] = "削除が完了しました。"
    redirect_to admin_gifts_path
  end

end
