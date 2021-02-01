class PurchaseForm
  
  include ActiveModel::Model
  #attr_accrsssorでここで取り扱う値を設定
  attr_accessor :postal_code, :prefecture_id, :street, :city, :building_name, :phone_number, :user_id, :item_id
  
  #addres validation
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :street
    validates :phone_number
  end

  #purchase validation
  with_options presence: true do
    validates :user_id
    validates :item_id
  end


  #saveメソッドを定義テーブルごとにcreateメソッドを適用させていくイメージ
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
      purchase_id: purchase.id #上記でpurchaseテーブルに保存したデータを変数purchaseに代入しそのIDを呼び出している
    )
  end
end
