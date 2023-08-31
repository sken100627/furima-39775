class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true} do
    validates :last_name
    validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶ一]+\z/, allow_blank: true} do
    validates :last_name_kana
    validates :first_name_kana
    end
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, allow_blank: true}

end
