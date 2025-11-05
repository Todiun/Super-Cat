class StaticController < ApplicationController
  def landing
  end

  def my_cats
    @cats = current_user.cats
  end
  
  def easter_egg
  end

  def about
  end

  def cart

    @tempcart = [] # Array temporaire qui contient le panier du user à traiter dans la view cart (qu'il soit connecté ou pas)

      if current_user # SI LOG ON

        if session[:cart] && session[:cart] != []
          for cat in session[:cart] # On copie l'intégralité des chats sauvegardés dans les cookies dans la BDD (au cas où l'user vient de se connecter mais avait déjà mis des trucs dans le panier)
            Cart.create(interested_user: current_user, carted_cat_id: cat)
            puts "Cookie transféré en BDD"
          end
        end

        session[:cart] = [] # on vide le cookie après avoir transféré dans la base de données
        puts "Session vidée du cart"

        for cat in current_user.carted_cats do # On met dans notre array temporaire l'ensemble des chats de la BDD mis en panier
          @tempcart.push(cat)
          puts "Cat transféré en tempcart"
        end

      else # SI LOG OUT

        if session[:cart]
          for cat in session[:cart]
            @tempcart.push(Cat.find(cat))
          end
        else
          @tempcart = []
        end

      end
  end

  def add_to_cart
    if current_user # Si connecté, on stocke dans la BDD direct
      Cart.create(interested_user: current_user, carted_cat_id: params[:format])
    else # Si pas connecté, on stocke dans le cookie
      session[:cart] ||= [] # crée le cookie cart si il n'existe pas déjà
      session[:cart].push(params[:format])
    end
    redirect_to :cart # redirige vers le panier apres avoir ajouté un élément
  end

  def remove_from_cart
    if current_user
      Cart.where(interested_user: current_user, carted_cat_id: params[:format]).first.destroy
    else
      session[:cart].delete(params[:format])
    end
    redirect_to :cart
  end

end