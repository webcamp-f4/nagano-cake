class Customers::SessionsController < Devise::SessionsController

	def new
      super do |resource|
      # custom code
	  end
	end

    def admin
      #super do |resource|
      # custom code
	  #end
	end

protected
  def configure_permitted_parameters
			# サインアップ時にストロングパラメータを追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_kana, :first_name_kana, :address, :last_name_kanji, :first_name_kanji, :postal_code, :tel, :admin])
  end

end
