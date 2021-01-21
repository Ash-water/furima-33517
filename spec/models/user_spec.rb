require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "ニックネームが必須であること" do
      user = User.new(nickname: "", email: "test@example", password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors.full_messages).to include("")
    end
    it "メールアドレスが必須であること" do
      
    end
    it "メールアドレスが一意性であること" do
      
    end
    it "メールアドレスは、@を含む必要があること" do
      
    end
    it "パスワードが必須であること" do
      
    end
    it "パスワードは、6文字以上での入力が必須であること" do
      
    end
    it "パスワードは、半角英数字混合での入力が必須であること" do
      
    end
    it "パスワードが存在してもパスワード確認が空では登録できないこと" do
      
    end
    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      
    end
    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      
    end
    it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      
    end
    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      
    end
    it "生年月日が必須であること" do
      
    end
    
  end
end