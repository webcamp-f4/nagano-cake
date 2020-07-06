class ApplicationController < ActionController::Base
	# deviseコントローラーにストロングパラメータを追加する
	before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :exception




	def after_sign_in_path_for(resource)
    	public_customer_path(resource)
  end

  def after_sign_out_path_for(resource)
		root_path(resource)
	end




	protected
		def configure_permitted_parameters
			# サインアップ時にストロングパラメータを追加
			devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_kana, :first_name_kana, :address, :last_name_kanji, :first_name_kanji, :postal_code, :tel])
		end

	private
		def current_cart_items
			current_cart_items = CartItems.find_by(id: session[:cart_items_id])
			current_cart_items = CartItems.create unless current_cart_items
			session[:cart_items_id] = current_cart_items.id
			current_cart
		end
end
