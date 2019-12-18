class FrontsController < ApplicationController
  before_action :move_to_index, only: :index

  def index
  end

  def home
  end

  private
  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
