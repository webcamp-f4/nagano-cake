class Public::CustomersController < ApplicationController
	def show
       @customer = Customer.find(params[:id])
	end

    def withdraw
       @customer = Customer.find(params[:id])
    end

   def update
   	@customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "successfully"
      redirect_to public_path(@customer.id)
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

