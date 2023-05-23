class Public::GiftsController < ApplicationController
  before_action :authenticate_customer!
  before_action :is_matching_login_customer,  only:[:edit, :update]

  def new
    if current_customer.name == "guestuser"
      flash[:notice] = "ゲストユーザーは新規投稿できません。"
      redirect_to gifts_path
    else
      @gift = Gift.new
      @scenes = Scene.all
    end
  end

  def create
    if current_customer.name == "guestuser"
      flash[:notice] = "ゲストユーザーは新規投稿できません。"
      redirect_to gifts_path
    else
      @gift = Gift.new(gift_params)
      @gift.customer_id = current_customer.id
      @tag_list = params[:gift][:tag_name].split(',')
        if @gift.save
           @gift.save_tag(@tag_list)
           redirect_to gifts_path
        else
          @scenes = Scene.all
          render :new
        end
      #@bookmark = current_customer.bookmarks.new(gift_id: @gift.id)
      #@bookmark.save
    end
  end

  def index
    @gifts = Gift.page(params[:page]).per(12).order(id: "DESC") ## idの降順
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
    #@scene = Scene.find(params[:id])
    #@tag=Tag.find(params[:tag_id]) #検索されたタグを受け取る
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
        redirect_to gift_path(@gift.id)
    else
        @scenes = Scene.all
        render:edit
    end

  end

  def destroy
    @gift = Gift.find(params[:id])
    @gift.destroy
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