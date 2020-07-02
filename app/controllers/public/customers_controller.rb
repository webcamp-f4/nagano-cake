class Public::CustomersController < ApplicationController
	def show
       @customer = Customer.find(params[:id])
	end

    def withdraw

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

   

end

