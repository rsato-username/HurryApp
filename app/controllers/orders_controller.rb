class OrdersController < ApplicationController
  before_action :move_to_index
  before_action :authenticate_user, {only: [:index]}

  def index
    @order = Order.all.order("created_at DESC").where(status: nil)
    # @order = Order.all.select("date(created_at)").group("date(created_at)")
  end

  def new
    @order = Order.new

    # return nil if params[:keyword] == ""
    # @orders = Salesperson.where('name LIKE(?)', "%#{params[:keyword]}%")
    # respond_to do |format|
    #   format.html 
    #   format.json 
    # end
  end

  def confirm
    @order = Order.new(order_params)
    render :new if @order.invalid?
  end

  def create
    # @order = Order.create(order_params)
    @order = Order.new(order_params)
    # @order = Order.new(
    #   seat: session[:seat],
    #   drink: session[:drink],
    #   salesperson: session[:salesperson]
    # )
    # binding.pry
    if @order.save
      @order.create_notification_order!(current_user, @order.id)
      redirect_to new_review_path
    else
      redirect_to new_order_path
      flash[:alert] = "座席とドリンクを入力してください"
    end
  end

  def show 
    @order = Order.find(params[:id])
  end

  def completed
    @order = Order.find(params[:id])
    @order.update(status: "完了")
    redirect_to orders_path
  end

  def history
    @order = Order.all.order("created_at DESC").where(status: "完了").kaminari_page(params[:page]).per(10)
  end

  private

  def order_params
    params.require(:order).permit(:seat, :salesperson_id, drink_ids: []).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to home_fronts_path unless user_signed_in?
  end

  def authenticate_user
    if current_user.admin_flg == nil
      redirect_to root_path
    else
    end
  end
end