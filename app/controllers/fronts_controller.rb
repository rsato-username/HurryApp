class FrontsController < ApplicationController
  before_action :move_to_index, only: :index

  def index
    @notice = Notification.where(checked: true)
    @drink = Drink.all
    @salesperson = Salesperson.all
  end

  def home
  end

  private
  def move_to_index
    redirect_to home_fronts_path unless user_signed_in?
  end
end
