Rails.application.routes.draw do
  ###########
  # 顧客用
  ###########
  scope module: :public do
    # URL /customers/sign_in ...
    devise_for :customers, skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }

    devise_scope :customer do
      resource :my_pages, only: [:show, :edit, :update] # 会員情報変更(マイページ)
      post '/guest_sign_in', to: 'sessions#guest_sign_in' #ゲストログイン用
    end

    #贈り物、コメント、タグ、ブックマーク一通り
    resources :gifts do
      resources :comments, except: [:index]
      # resources :tags, except: [:index] # TODO: gifts内部でロジックが組む場合不要の可能性あり
      resources :bookmarks, only: [:create, :show, :destroy]
    end

    get "/search" => "public/gifts#index", as: 'search'

  end

  ###########
  # 管理者用
  ###########
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
      sessions: "admin/sessions"
  }
  namespace :admin do
    get '/', to: 'customers#index' #管理者トップページ会員一覧
    #会員一覧、詳細、削除（強制退会）
    resources :customers, only: [:index, :show, :destroy]

    #贈り物一覧、詳細、削除 コメント参照、削除 タグ参照、削除
    resources :gifts, only: [:index, :show, :destroy]do
      resources :comments, only: [:show, :destroy]
      resources :tags, only: [:show, :destroy]
    end

    #シーン一覧、作成、編集、更新
    resources :scenes, only: [:index, :create, :edit, :update]
  end

  get "/admin/search" => "admin/gifts#index"

  get '/about', to: 'homes#about'
  root to: 'homes#top'

end

# MEMO: Devise
# devise_for...Deviseを使って認証を行うためのルーティングを自動的に生成するためのヘルパーメソッド
# :adminsというシンボルを受け取り、:adminsという名前のモデルを扱う
# :registrationsと:passwordsをスキップするオプションが渡されているため、ユーザーの登録やパスワードのリセットを行う機能が無効化
# :sessionsコントローラーの名前をadmin/sessionsに変更するためのオプションが渡されています。これにより、管理者用のログイン画面を別途用意することができる
# path: ''ルートパスのパス名が空文字列に設定され、管理者ログインページへのURLが/admins/sign_inになる
# path_namesオプションでは、デフォルトのパス名を変更している
#
#  devise_for :admin, skip: [:registrations, :passwords], controllers: {
#    sessions: "admin/sessions"
#  }, path: '', path_names: { sign_in: 'sign_in', sign_out: 'sign_out'}
# get "search_tag"=>"posts#search_tag"