class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cat_ownerships
  has_many :cats, through: :cat_ownerships
  has_many :comments
  has_many :carts, foreign_key: :interested_user_id
  has_many :carted_cats, through: :carts, source: :carted_cat
end
