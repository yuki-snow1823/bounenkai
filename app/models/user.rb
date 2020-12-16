class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  attachment :profile_image, destroy: false
  has_many :books, dependent: :destroy

  validates :name, uniqueness: true
  validates :name, length: {maximum: 20, minimum: 2}
  validates :introduction, length: {maximum: 50}
end

#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :trackable,:validatable
  
#   attachment :profile_image, destroy: false
#   has_many :books, dependent: :destroy

#   #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
#   validates :name, length: {maximum: 20, minimum: 2}
#   validates :introduction, length: {maximum: 50}

