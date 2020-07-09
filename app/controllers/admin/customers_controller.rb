class Admin::CustomersController < ApplicationController
	def index
		@customers = Customer.all
	end
	def show
		@customer = Customer.find(params[:id])
	end
	def edit
		@customer = Customer.find(params[:id])
	end
	def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
          redirect_to public_customer_path(@customer.id)
        else
          render "edit"
        end
    end
    private

    def customer_params
      params.require(:customer).permit(:last_name_kanji,:first_name_kanji ,:last_name_kana, :first_name_kana, :email, :postal_code, :address, :tel )
    end
end
