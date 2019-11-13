class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :generate_userid

  private
  def generate_userid
    self.userid = (0...8).map{ ('0'..'9').to_a[rand(10)] }.join
  end

  has_many  :orders
  has_many  :reviews

end
