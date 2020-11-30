class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def create
    User.create!(params.require(:user).permit(:login, :last_name, :first_name, :admin))

    redirect_to '/'
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    User.find(params[:id]).update!(params.require(:user).permit(:login, :last_name, :first_name, :admin))

    redirect_to '/'
  end

  def show

  end

  def destroy

  end
end