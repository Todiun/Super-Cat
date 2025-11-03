class StaticController < ApplicationController
  def landing
  end

  def my_cats
    @cats = current_user.cats
  end
end