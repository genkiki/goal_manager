class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:show, :edit, :destroy]}

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/", notice: "登録成功しました"
    else
      session[:notice] = "登録失敗しました"
      render new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
