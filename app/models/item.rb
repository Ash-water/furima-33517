class Item < ApplicationRecord
  #Assosiations
  belongs_to :user
  has_one_attached :image
  #Assosiations with ActiveHash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :prefecture, :delivery_fee, :quality, :shipping_date,

  #validations
  with_options presence: true do
    validates :name
    validates :price
    validates :item_description
    validates :category_id
    validates :quality_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_data_id
    validates :user
  end

  
end
