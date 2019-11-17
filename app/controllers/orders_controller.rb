class OrdersController < ApplicationController
  before_action :move_to_index

  def index
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    if @order.save
      redirect_to root_path
    else
      render action: 'index'
    end
  end
 
  def show
    @order = Order.find[:id]
  end 

  private

  def order_params
    params.require(:order).permit(:seat, { drink: [] }, :salesperson).merge(user_id: current_user.id)
  end

  # def drink_params
  #   params.require(:drink).permit(:name)
  # end

  # def food_params
  #   params.require(:food).permit(:name)
  # end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
