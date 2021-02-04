require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @item = FactoryBot.create(:item) # itemをまず生成して、それに紐づくuser生成されます。それをしたの記述でmergeしてる感じ.fakerを使うことでユーザーの重複も解消できる
    @purchase_form = FactoryBot.build(:purchase_form, user_id: @item.user_id, item_id: @item.id)
    sleep 1
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it '必須情報が全て適切に入力されている' do
        expect(@purchase_form).to be_valid
      end

      it '建物名がなくても購入できる' do
        @purchase_form.building_name = ""
        expect(@purchase_form).to be_valid
      end
    end

    context '商品が購入できない時 ' do
      it '郵便番号がないと購入できない' do
        @purchase_form.postal_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @purchase_form.postal_code = 1_234_567
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Postal code has to be include hyphen')
      end
      it '都道府県がないと購入できない' do
        @purchase_form.prefecture_id = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が未選択(IDが1)だと購入できない' do
        @purchase_form.prefecture_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村がないと購入できない' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地がないと購入できない' do
        @purchase_form.street = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Street can't be blank")
      end
      it '電話番号がないと購入できない' do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンを使うと購入できない' do
        @purchase_form.phone_number = '123-4567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number has to be only 11numbers')
      end
      it 'トークンが存在しないと購入できない' do
        @purchase_form.token = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idがないと購入できない' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがないと購入できない' do
        @purchase_form.item_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
