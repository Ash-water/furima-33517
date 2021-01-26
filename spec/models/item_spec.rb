require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do

    context '商品が出品できる時' do
      it '必須情報が全て適切に入力されている' do
      @item = FactoryBot.build(:item)
      expect(@item).to be_valid
      end
    end
  
  end
end

# RSpec.describe User, type: :model do
#   before do
#     @user = FactoryBot.build(:user)
#   end

#   describe 'ユーザー新規登録' do

#     context '新規登録できる時' do
#       it '全ての入力項目が適切に入力されている' do
#         expect(@user).to be_valid
#       end
#     end