class PurchaseForm
  include ActiveModel::Model
  # attr_accrsssorでここで取り扱う値を設定
  attr_accessor :postal_code, :prefecture_id, :street, :city, :building_name, :phone_number, :user_id, :item_id, :token

  # addres validation
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :street
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token, presence: true
  end

  validates :prefecture_id, numericality: true
  validates  :prefecture_id, numericality: { other_than: 1 }

  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'has to be include hyphen' }
  validates :phone_number, format: { with: /\A\d{11}\z/, message: 'has to be only 11numbers' }

  # saveメソッドを定義テーブルごとにcreateメソッドを適用させていくイメージ
  def save
    purchase = Purchase.create(
      user_id: user_id,
      item_id: item_id
    )

    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      street: street,
      city: city,
      building_name: building_name,
      phone_number: phone_number,
      purchase_id: purchase.id # 上記でpurchaseテーブルに保存したデータを変数purchaseに代入しそのIDを呼び出している
    )
  end
end
