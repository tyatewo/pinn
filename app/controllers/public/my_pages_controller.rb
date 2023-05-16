class Public::MyPagesController < ApplicationController
  before_action :authenticate_customer!
 # before_action :ensure_guest_customer, only: [:edit]

  def show
    @customer = current_customer
    @gifts = @customer.gifts
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to my_page_path(@customer)
    else
      render :edit
    end
  end

  def bookmarks
    #customer = Customer.find(params[:id])
    @bookmarks = current_customer.bookmarks
  end



private

  def customer_params
    params.require(:customer).permit(:name, :profile, :profile_image)
  end


 # def ensure_guest_customer
   # @customer = Customer.find()
    #if @customer.name == "guestuser"
      #redirect_to customer_path(current_customer) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    #end
  #end


end
