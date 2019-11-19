class OrdersController < ApplicationController
  before_action :move_to_index

  def index
    @order = Order.new
    return nil if params[:keyword] == ""
    @orders = Salesperson.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html 
      format.json 
    end
  end

  def create
    @order = Order.create(order_params)
    if @order.save
      redirect_to reviews_path
    else
      redirect_to orders_path
      flash[:notice] = "座席とドリンクを入力してください"
    end
  end

  private

  def order_params
    params.require(:order).permit(:seat, { drink: [] }, :salesperson).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end