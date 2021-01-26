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
      end
      it '商品名が必須であること' do
      end
      it '商品の説明が必須であること' do
      end
      it 'カテゴリーの情報が必須であること' do
      end
      it '商品の状態についての情報が必須' do
      end
      it '配送料の負担についての情報が必須であること' do
      end
      it '発送元の地域についての情報が必須であること' do
      end
      it '発送までの日数についての情報が必須であること' do
      end
      it '価格についての情報が必須であること' do
      end
      it '価格の範囲が¥300~¥9,999,999の間であること' do
      end
      it '販売価格は半角数字のみ保存可能であること' do
      end
    end

  end
end

