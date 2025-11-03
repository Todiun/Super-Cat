class Cat < ApplicationRecord
    has_many :comments
    has_many :cat_ownerships
    has_many :users, through: :cat_ownerships
end
