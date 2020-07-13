class Public::ShippingsController < ApplicationController


def create
	shipping = Shipping.new(shipping_params)
	shipping.customer_id = current_customer.id
	if shipping.save
	   redirect_to public_shippings_path(shipping.id)
    else
       render "index"
    end
end



def index
	@shipping = Shipping.new
	@shippings = current_customer.shippings
end


def edit
	@shipping = Shipping.find(params[:id])
end


def update
	@shipping = Shipping.find(params[:id])
	if @shipping.update(shipping_params)
	  redirect_to public_shippings_path(@shipping.id)
    else
      render "edit"
    end
end

def destroy
	shipping = Shipping.find(params[:id])
	shipping.destroy
	redirect_to public_shippings_path
	
end

def shipping_params
      params.require(:shipping).permit(:postal_code, :address, :name)
  end


end
