require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do

    context '商品が出品できる時' do
      it '必須情報が全て適切に入力されている' do
      expect(@item).to be_valid
      end
    end
  
    context '商品が出品できない時' do
      it '商品画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.item_description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報が必須' do
        @item.quality_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end
      it '配送料の負担についての情報が必須であること' do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数についての情報が必須であること' do
        @item.shipping_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it '価格についての情報が必須であること' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が¥300~¥9,999,999の間であること' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 値段は300円~9,999,999円の範囲内で設定してください")
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = "aaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 数字以外が入力されています")
      end
    end

  end
end

