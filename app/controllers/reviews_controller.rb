class ReviewsController < ApplicationController
  before_action :move_to_index

  def index
    @review = Review.new
  end

  def create
    @review = Review.new
    @revriews = Review.create(review_params)
    if @reviews.save
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
    redirect_to new_user_session_path unless user_signed_in?
  end
end
