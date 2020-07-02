class Public::CustomersController < ApplicationController
	def show
       @user = Customer.find(params[:id])
	end

    def withdraw
    	
    end

   def update
	
   end

   def edit
   	
   end

   

end

