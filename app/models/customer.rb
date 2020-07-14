class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (self.is_deleted == true)
  end

  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :address, presence: true
  validates :last_name_kanji, presence: true
  validates :first_name_kanji, presence: true
  validates :postal_code, presence: true
  validates :tel, presence: true

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shippings, dependent: :destroy

  def Customer.search(search, select)
    if select == "1"
      Customer.where(['last_name_kanji LIKE ?', "%#{search}%"])
    else
      Customer.all
    end
  end

end
