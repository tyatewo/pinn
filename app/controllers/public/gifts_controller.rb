class Public::GiftsController < ApplicationController
  before_action :authenticate_customer!
  before_action :is_matching_login_customer,  only:[:edit, :update]

  def new
    if current_customer.name == "guestuser"
      flash[:notice] = "ゲストユーザーは新規投稿できません。"
      redirect_to gifts_path
    end

    @gift = Gift.new
    @scenes = Scene.all
  end

  def create
    if current_customer.name == "guestuser"
      flash[:notice] = "ゲストユーザーは新規投稿できません。"
      redirect_to gifts_path
    end
    @gift = Gift.new(gift_params)
    @gift.customer_id = current_customer.id
    @tag_list = params[:gift][:tag_name].split(',')
    if @gift.save == false
      @scenes = Scene.all
      render :new
      return
    end
    @gift.save_tag(@tag_list)
    flash[:notice] = "投稿が完了しました。"
    redirect_to gifts_path
  end

  def index

    if params[:search] #キーワード検索
      @gifts = Gift.where('name LIKE ?', "%#{params[:search]}%").page(params[:page]).per(12)
    elsif params[:tag_id] #タグ検索
      @gifts = Tag.find(params[:tag_id]).gifts.page(params[:page]).per(12)
    elsif params[:scene_id] #シーン検索
      @gifts = Scene.find(params[:scene_id]).gifts.page(params[:page]).per(12)
    elsif params[:latest] #新しい順
      @gifts = Gift.latest.page(params[:page]).per(12)
    elsif params[:old] #古い順
      @gifts = Gift.old.page(params[:page]).per(12)
    elsif params[:bookmark_count] #ブックマークが多い順
       @gifts = Gift.includes(:bookmarks).sort {|a,b| b.bookmarks.size <=> a.bookmarks.size}
       @gifts = Kaminari.paginate_array(@gifts).page(params[:page]).per(12)
    else
      @gifts = Gift.order(id: "DESC").page(params[:page]).per(12)
    end

    @scenes = Scene.all
    @tag_list = Tag.all

  end

  def search_tag
    @gifts = Gift.all
    @gift = Gift.find(params[:gift_id])
    @tag_list = Tag.all #検索結果画面でもタグ一覧表示
    @tag = Tag.find(params[:tag_id]) #検索されたタグを受け取る
    @gift_tags = @tag.gifts.page(params[:page]).per(12) #検索されたタグに紐づく投稿を表示
  end


  def search
    @gifts = Gift.search(params[:search]) #Viewのformで取得したパラメータをモデルに渡す
  end

  def show
    @gift = Gift.find(params[:id])
    @gift.reload # キャッシュをクリアして最新のデータを取得
    @comment = Comment.new
    @comments = @gift.comments
    @tag_list = @gift.tags
    @customer = current_customer unless current_customer.name == "guestuser"
  end

  def edit
    @gift = Gift.find(params[:id])
    @tag_list = @gift.tags.pluck(:name).join(',') # pluckはmapと同じ意味
    @scenes = Scene.all
  end

  def update
    @gift = Gift.find(params[:id]) # gift id持ってくる
    tag_list = params[:gift][:tag_name].split(',') # 入力されたタグを受け取る
    if @gift.update(gift_params) # もし更新されたら
        @old_relations=GiftTag.where(gift_id: @gift.id) # gift_idにくっついてるタグを@oldに入れる
        @old_relations.each do |relation| # それぞれ取り出す
          relation.delete # 消す
        end
        @gift.save_tag(tag_list) # gift_idにくっついてるタグを
        flash[:notice] = "編集が完了しました。"
        redirect_to gift_path(@gift.id)
    else
        @scenes = Scene.all
        render:edit
    end

  end

  def destroy
    @gift = Gift.find(params[:id])
    @gift.destroy
    flash[:notice] = "削除が完了しました。"
    redirect_to gifts_path
  end


  private

  def gift_params
    params.require(:gift).permit(:scene_id, :name, :shop_name, :price, :introduction, :gift_image)
  end

  def is_matching_login_customer
    @gift = Gift.find(params[:id])
    @customer = @gift.customer
    redirect_to (gifts_path) unless @customer == current_customer
  end

end


#######
# MEMO
#######

# notice:'投稿完了しました'