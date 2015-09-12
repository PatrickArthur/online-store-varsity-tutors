class User < ActiveRecord::Base
  attr_accessor :roles_mask
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include RoleModel

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :address

  VALID_PHONE_NUMBER_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/
  validates :phone_number_primary, presence: true, length: {maximum: 15},
                    format: { with: VALID_PHONE_NUMBER_REGEX }

  validates :terms_of_service, inclusion: [true, false]
  validates :age_verification, inclusion: [true, false]
  # validates :email, email: true, presence: true, uniqueness: true

  roles :customer, :admin

  def name
    "#{first_name} #{last_name}"
  end

  def customer?
    has_role? :customer
  end

  def admin?
    has_role? :admin
  end

end

