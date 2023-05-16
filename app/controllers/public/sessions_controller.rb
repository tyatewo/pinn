# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
    before_action :customer_state, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

    def guest_sign_in
      customer = Customer.guest
      sign_in customer
      redirect_to gifts_path, notice: 'guestuserでログインしました。'
    end

    def after_sign_in_path_for(resource)
    gifts_path #贈り物一覧へ遷移
    end


    protected

  # 退会しているかを判断するメソッド
    def customer_state
      ## 【処理内容1】 入力されたemailからアカウントを1件取得
      @customer = Customer.find_by(email: params[:customer][:email])
      ## アカウントを取得できなかった場合、このメソッドを終了する
      return if !@customer
      ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
      if @customer.valid_password?(params[:customer][:password]) && !@customer.is_deleted
        ## ステータスがtrueだった場合createアクションを実行させる
        sign_in_and_redirect @customer, event: :authentication
      elsif @customer.valid_password?(params[:customer][:password])
        ## ステータスがfalseだった場合サインアップ画面に遷移する処理を実行する
        redirect_to new_customer_registration_path, alert: "アカウントが無効です。サポートにお問い合わせください。"
      end
    end
end
