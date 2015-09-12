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
    (@user.save) ? (new_user_valid?) : (new_user_not_valid?)
  end

  private

  def user_params
    params.require(:user).permit(
      :email, :current_password, :password,
      :password_confirmation, :first_name, :last_name,
      :address, :city, :state, :country, :zipcode,
      :phone_number_primary, :phone_number_secondary,
      :terms_of_service, :age_verification
    )
  end

  def new_user_valid?
    flash[:notice] = 'Successful registration'
    redirect_to products_path
  end

  def new_user_not_valid?
    flash[:alert] = 'Errors, not registered'
    render action: 'new'
  end
end
