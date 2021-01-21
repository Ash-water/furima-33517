class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 新規登録/ユーザー情報バリデーション
  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'パスワードには英字と数字の両方を含めて設定してください'

  # 新規登録/本人情報確認
  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name
    validates :furi_first
    validates :furi_last
    validates :date_of_birth
  end

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'カタカナを使用してください' } do
    validates :furi_last
    validates :furi_first
  end
end
