class OrdersController < ApplicationController
  before_action :move_to_index
  before_action :authenticate_user, {only: [:index]}

  def index
    @order = Order.all.order("created_at DESC")
  end

  def new
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
      redirect_to new_review_path
    else
      redirect_to new_order_path
      flash[:alert] = "座席とドリンクを入力してください"
    end
  end

  private

  def order_params
    params.require(:order).permit(:seat, { drink: [] }, :salesperson).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def authenticate_user
    if current_user.admin_flg == nil
      redirect_to root_path
    else
    end
  end
end