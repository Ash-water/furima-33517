class PurchaseForm
  
  include ActiveModel::Active
  #attr_accrsssorでここで取り扱う値を設定
  attr_accessor :postal_code, :prefecture_id, :street, :building_name, :phone_number, :user, :item

  #addres validation
  with_options presence: true do
    validates :postal_code
    velidates :prefecture_id
    validates :city
    validates :street
    validates :phone_number
    validates :purchase
  end

  #purchase validation
  with_options presence: true do
    validates :user
    validates :item
  end

  #card validation
  with_options presence:true do
    validates :number
    validates :cvc
    validates :exp_month
    validates :exo_year
  end
  
  #saveメソッドを定義テーブルごとにcreateメソッドを適用させていくイメージ

  

