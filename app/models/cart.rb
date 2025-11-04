class Cart < ApplicationRecord
    belongs_to :interested_user, class_name: "User" 
    belongs_to :carted_cat, class_name: "Cat" 
end
