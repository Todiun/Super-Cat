class Cat < ApplicationRecord
    has_many :comments
    has_many :cat_ownerships
    has_many :users, through: :cat_ownerships
    has_many :carts, foreign_key: :carted_cats_id
    has_many :interested_users, through: :carts, source: :interested_user
end
