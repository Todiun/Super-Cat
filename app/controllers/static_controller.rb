class StaticController < ApplicationController
  def landing
  end

  def my_cats
    @cats = current_user.cats
  end
  
  def easter_egg

  end
  



  def cart
    @tempcart = []
      if current_user
        
      else
        for cat in session[:cart]
          @tempcart.push(Cat.find(cat))
        end
      end
      
  end
  def add_to_cart
    session[:cart] ||= []
    session[:cart].push(params[:format])
  end
end