# user model
class User < ActiveRecord::Base
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable


  validates :email, email: true, presence: true, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end

end
