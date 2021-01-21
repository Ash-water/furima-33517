require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'ニックネームが必須であること' do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      user = FactoryBot.build(:user)
      user.save
      user2 = FactoryBot.build(:user)
      user2.valid?
      expect(user2.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること' do
      user = FactoryBot.build(:user)
      user.email = 'testtesttest'
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須であること' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      user = FactoryBot.build(:user)
      user.password = '11aa'
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英字のみでは登録できないこと' do
      user = FactoryBot.build(:user)
      user.password = 'aaaaaa'
      user.valid?
      expect(user.errors.full_messages).to include('Password パスワードには英字と数字の両方を含めて設定してください')
    end
    it 'パスワードは、半角数字のみでは登録できないこと' do
      user = FactoryBot.build(:user)
      user.password = '111111'
      user.valid?
      expect(user.errors.full_messages).to include('Password パスワードには英字と数字の両方を含めて設定してください')
    end
    it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
      user = FactoryBot.build(:user)
      user.password_confirmation = '222aaa'
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'ユーザー本名は、名字が必須であること' do
      user = FactoryBot.build(:user)
      user.last_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'ユーザー本名は、名前がが必須であること' do
      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      user = FactoryBot.build(:user)
      user.last_name = 'test'
      user.first_name = 'taro'
      user.valid?
      expect(user.errors.full_messages).to include('First name 全角文字を使用してください', 'Last name 全角文字を使用してください')
    end
    it 'ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること' do
      user = FactoryBot.build(:user)
      user.furi_last = ''
      user.furi_first = ''
      user.valid?
      expect(user.errors.full_messages).to include("Furi first can't be blank", "Furi last can't be blank")
    end
    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
      user = FactoryBot.build(:user)
      user.furi_last = 'ああああ'
      user.furi_first = 'ああああ'
      user.valid?
      expect(user.errors.full_messages).to include('Furi last カタカナを使用してください', 'Furi first カタカナを使用してください')
    end
    it '生年月日が必須であること' do
      user = FactoryBot.build(:user)
      user.date_of_birth = ''
      user.valid?
      expect(user.errors.full_messages).to include("Date of birth can't be blank")
    end
  end
end
