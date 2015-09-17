# users controller
class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    (@user.valid?) ? (new_user_valid?) : (new_user_not_valid?)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :city,
                                 :state, :country, :zipcode)
  end

  def new_user_valid?
    @user.save!
    flash[:notice] = 'Successful registration'
    redirect_to products_path
  end

  def new_user_not_valid?
    flash[:alert] = 'Errors, not registered'
    redirect_to new_user_path
  end
end
