# user model
class User < ActiveRecord::Base
  attr_accessor :roles_mask
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  include RoleModel

  validates :email, email: true, presence: true, uniqueness: true

  roles :customer, :admin

  def name
    "#{first_name} #{last_name}"
  end

  private

end
