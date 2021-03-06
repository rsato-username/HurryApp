class ReviewsController < ApplicationController
  before_action :move_to_index
  before_action :authenticate_user, {only: [:index]}

  def index
    @review = Review.all.order("created_at DESC").kaminari_page(params[:page]).per(10)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      @review.create_notification_review!(current_user, @review.id)
      redirect_to root_path
    else
      redirect_to reviews_path
      flash[:notice] = "いつも綺麗にご使用いただきありがとうございます"
    end
  end

  private

  def review_params
    params.require(:review).permit(:text, :rate).merge(user_id: current_user.id)
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
