class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        
  validates :nickname, presence: true
  EMAIL_REGEX = /@.+/
  validates :email, presence: true, uniqueness: true,
            format: { with:EMAIL_REGEX, message: "@で入力してください" } 
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i.freeze
  validates :encrypted_password, presence: true,
            format: {with: PASSWORD_REGEX, message: 'には英字と数字の両方を含め,6文字以上で設定してください'}
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナを使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end
  validates :date_of_birth, presence: true
end
