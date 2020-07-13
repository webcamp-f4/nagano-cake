class Public::CustomersController < ApplicationController
  def show
       @customer = Customer.find(params[:id])
  end

    def withdraw #退会画面を表示するアクション
       @customer = Customer.find(params[:id])
    end

    def switch
      @customer = Customer.find(params[:id])
      #is_deletedカラムにフラグを立てる(defaultはtrue)
      @customer.update(is_deleted: false)
      reset_session #URLを踏ませずにコントローラーから直接サインアウトの指示を出す（device公式)
      redirect_to root_path
    end

   def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to public_customer_path(@customer.id)
    else
      render "edit"
    end
   end

   def edit
    @customer = Customer.find(params[:id])
   end



private

def customer_params
      params.require(:customer).permit(:last_name_kanji,:first_name_kanji ,:last_name_kana, :first_name_kana, :email, :postal_code, :address, :tel )
end


end

