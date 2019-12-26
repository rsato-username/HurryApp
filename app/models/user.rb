class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:email, :userid]

  before_create :generate_userid


  validates :name, presence: true
  validates :email, uniqueness: true  
  validates :password, presence: true, length: { minimum: 7 }  #:password_confirmation,allow_blank: true 抜かした


  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    if login
      where(conditions).where(["lower(email) = lower(:email) AND userid = :userid", { email: email, userid: userid }]).first
    else
      where(conditions).first
    end
  end

  private
  def generate_userid
    self.userid = (0...8).map{ ('0'..'9').to_a[rand(10)] }.join
  end

  has_many :orders
  has_many :reviews
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

end
