class Item < ApplicationRecord
  # Assosiations
  belongs_to :user
  has_one_attached :image
  # Assosiations with ActiveHash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :delivery_fee
  belongs_to :quality
  belongs_to :shipping_date

  # validations
  with_options presence: true do
    validates :name
    validates :image
    validates :price
    validates :item_description
    validates :category_id
    validates :quality_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :user
  end
  # validations for ActiveHash ID, the ID can't be 1
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :quality_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_date_id
  end

  # price validates
  validates :price, numericality: { with: /\A[0-9]+\z/, message: '半角数字以外が入力されています' }
  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    message: '値段は300円~9,999,999円の範囲内で設定してください'
  }
end
