class PurchaseForm
  
  include ActiveModel::Active
  #attr_accrsssorでここで取り扱う値を設定
  attr_accessor :postal_code, :prefecture_id, :street, :building_name, :phone_number, :number, :cvc, :exp_moth, :exp_year, :user, :item

  #validationの記述

  #saveメソッドを定義テーブルごとにcreateメソッドを適用させていくイメージ

