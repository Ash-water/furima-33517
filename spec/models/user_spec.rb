require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    
    context '新規登録できない時' do
      it '全ての入力項目が適切に入力されている' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        user2 = FactoryBot.build(:user)
        user2.valid?
        expect(user2.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'testtesttest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '11aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角英字のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角英字数字の混合で入力してください')
      end
      it 'パスワードは、半角数字のみでは登録できないこと' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角英字数字の混合で入力してください')
      end
      it 'パスワードは、全角では登録できないこと' do
        @user.password = '１１１www'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角英字数字の混合で入力してください')
      end
      it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
        @user.password_confirmation = '222aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名は、名字が必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'ユーザー本名は、名前が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザー本名の名字は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end
      it 'ユーザー本名の名前は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it 'ユーザー本名のフリガナの名字が必須であること' do
        @user.furi_last = ''
        @user.furi_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Furi last can't be blank")
      end
      it 'ユーザー本名のフリガナの名前が必須であること' do
        @user.furi_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Furi first can't be blank")
      end
      it 'ユーザー本名のフリガナの名字は全角（カタカナ）での入力が必須であること' do
        @user.furi_last = 'ああああ'
        @user.furi_first = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furi last カタカナを使用してください')
      end
      it 'ユーザー本名のフリガナの名前は全角（カタカナ）での入力が必須であること' do
        @user.furi_first = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furi first カタカナを使用してください')
      end
      it '生年月日が必須であること' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
