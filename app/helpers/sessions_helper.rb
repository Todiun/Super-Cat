module SessionsHelper
    def get_unowned_cats
        cats = []
        for cat in Cat.all
            if current_user && !(current_user.cats.include? cat) # si l'user est connecté et que l'user ne possede pas le chat
                cats.push(cat)
            elsif !current_user # si user est pas connecté on met tous les chats
                cats.push(cat)
            end
        end
        return cats
    end

    def accept_payment
        for cat in current_user.carted_cats do
            CatOwnership.create(user: current_user, cat: cat)
        end
        current_user.carted_cats.destroy_all
    end
end