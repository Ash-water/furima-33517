require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @item = FactoryBot.create(:item) #itemをまず生成して、それに紐づくuser生成されます。それをしたの記述でmergeしてる感じ.fakerを使うことでユーザーの重複も解消できる
    @purchase_form = FactoryBot.build(:purchase_form, user_id:@item.user_id, item_id:@item.id)
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it '必須情報が全て適切に入力されている' do
        expect(@purchase_form).to be_valid
      end
    end
  end
end