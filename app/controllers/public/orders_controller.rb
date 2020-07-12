class Public::OrdersController < ApplicationController

   def index
   	@orders = Order.where(customer_id:current_customer)
   end

   def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
   end



	def new
		@shippings = current_customer.shippings
		@shipping = Shipping.new
		@order = Order.new
	end

	#注文情報入力画面でボタンを押して情報をsessionに保存
	def create
		@shippings = current_customer.shippings
		@shipping = Shipping.new
		@order = Order.new
		session[:pay_method] = params[:pay_method]
		if params[:select] == "my_address"
			session[:address] = current_customer.postal_code + current_customer.address + current_customer.last_name_kanji + current_customer.first_name_kanji
		elsif params[:select] == "select_address"
			session[:address] = params[:address]
		end
		if session[:address].present? && session[:pay_method].present?
			redirect_to public_orders_confirm_path
		else
			flash[:order_new] = "支払い方法と配送先を選択して下さい"
			render "new"
		end
	end



	#注文情報入力画面にて新規配送先の登録
	def create_shipping
		@shipping = Shipping.new(shipping_params)
		@shipping.customer_id = current_customer.id
		@shipping.save
		redirect_to new_public_order_path
	end

	#注文情報確認画面
	def confirm
		@orders = current_customer.orders
		@total_price = calculate(current_customer)
        if session[:address].length <8
        	@address = Shipping.find(session[:address])
      	end
	end

	def thanks
	end

	def create_order
		#オーダーの保存
		@order = Order.new
		@order.customer_id = current_customer.id
		@order.shipping_address = session[:address]
		@order.pay_method = session[:pay_method]
		@order.total_due = calculate(current_customer)
		@order.status = 0
		@order.save
		# saveができた段階でOrderモデルにorder_idが入る

		#オーダー商品ごとの詳細の保存
		current_customer.cart_items.each do |cart|
			@order_item = OrderItem.new
			@order_item.order_id = @order.id
			#binding.pry
			@order_item.name = cart.item.name
			@order_item.price = cart.item.price
			@order_item.amount = cart.amount
			@order_item.making_status = 0
			@order_item.save
		end
		current_customer.cart_items.destroy_all
		session.delete(:address)
		session.delete(:pay_method)
		redirect_to public_thanks_order_path
	end




	private



	def shipping_params
		params.require(:shipping).permit(:customer_id, :name, :postal_code, :address)
	end

    def order_params
        params.require(:order).permit(:customer_id, :address, :pay_method, :postage, :total_due, :status)
    end



	def calculate(customer)
		total_price = 0
		customer.cart_items.each do |cart_item|
			total_price += cart_item.amount * cart_item.item.price.to_i
		end
		return (total_price * 1.1).floor
	end
end
