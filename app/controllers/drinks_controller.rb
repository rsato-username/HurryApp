class DrinksController < ApplicationController
  
  def index
    @drink = Drink.find(params[:id])
  end
end
