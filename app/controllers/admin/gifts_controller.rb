class Admin::GiftsController < ApplicationController

  def index
    @gifts = Gift.page(params[:page]).per(12)
      if params[:search]
        @gifts = Gift.where('name LIKE ?', "%#{params[:search]}%").page(params[:page]).per(12)
      end

      if params[:tag_id]
        @gifts = Tag.find(params[:tag_id]).gifts.page(params[:page]).per(12)
      end

      if params[:scene_id]
        @gifts = Scene.find(params[:scene_id]).gifts.page(params[:page]).per(12)
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


  # def edit
  #   @gift = Gift.find(params[:id])
  #   @tag_list=@gift.tags.pluck(:name).join(',') # pluckはmapと同じ意味
  #   @scenes = Scene.all
  # end

  # def update
  #   @gift = Gift.find(params[:id]) # gift id持ってくる
  #   tag_list=params[:gift][:name].split(',') # 入力されたタグを受け取る
  #   if @gift.update(gift_params) # もし更新されたら
  #       @old_relations=GiftTag.where(gift_id: @gift.id) # gift_idにくっついてるタグを@oldに入れる
  #       @old_relations.each do |relation| # それぞれ取り出す
  #       relation.delete # 消す
  #       end
  #       @gift.save_tag(tag_list) # gift_idにくっついてるタグを
  #       redirect_to gift_path(@gift.id)
  #   else
  #     @scenes = Scene.all
  #     render:edit
  #   end
  # end

  def destroy
    @gift = Gift.find(params[:id])
    @gift.destroy
    #@bookmark = current_customer.bookmarks.find_by(gift_id: @gift.id)
    #@bookmark.destroy
    redirect_to admin_gifts_path
  end


  # private

  # def gift_params
  #   params.require(:gift).permit(:scene_id, :name, :shop_name, :price, :introduction, :gift_image)
  # end

end
