class Public::OrdersController < ApplicationController
	def new
		@order = Order.new
		@shippings = current_customer.shippings
		@shipping = Shipping.new
	end

	#注文情報入力画面でボタンを押して情報をsessionに保存
	def create
		@order = Order.new(order_params)
		session[:pay_method] = params[:pay_method]
		if params[:select] == "my_address"
			session[:address] = current_customer.postal_code + 
			current_customer.address + current_customer.last_name_kanji + current_customer.first_name_kanji
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
		redirect_to public_orders_confirm_path
	end

	#注文情報確認画面
	def confirm
		@orders = current_customer.orders
		@total_price = calculate(current_customer)
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
		current_customer.cart_items.each do |cart_item|
			@order_item = OrderItem.new
			@order_item.order_id = @order.id
			@order_item.price = cart_item.items.price
			@order_item.amount = cart_item.amount
			@order_item.making_status = 0
			@order_item.save
		end
		current_customer.cart_items.destroy_all
		session.delete(:address)
		session.delete(:pay_method)
		redirect_to public_orders_thanks_path
	end

	private
	def shipping_params
		params.require(:shipping).permit(:customer_id, :name, :postal_code, :address)
	end

	def order_params
		params.require(:order).permit(:pay_method, :total_due,
		 :postage, :status)
	end

	def calculate(customer)
		total_price = 0
		customer.cart_items.each do |cart|
			total_price = total_price + (cart.amount * cart.items.price)
		end
		return (total_price * 1.1).floor
	end
end
