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
      flash[:notice] = "登録失敗しました"
      render new_user_path
    end
  end

  def login
  end

  def signin
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to goals_path, notice: "ログインしました。"
    else
      flash[:notice] = "ログイン失敗しました"
      render :login
    end
  end

  def signin_easy
    user = User.find(1)

    if user&.authenticate("test")
      session[:user_id] = user.id
      redirect_to goals_path, notice: "ログインしました。"
    else
      flash[:notice] = "ログイン失敗しました"
      render :login
    end
  end

  def logout
    reset_session
    redirect_to goals_path, notice: "ログアウトしました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
