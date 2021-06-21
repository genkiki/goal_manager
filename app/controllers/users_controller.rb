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

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    user = User.find_by(id: session[:user_id])
    if user.update(user_params)
      logger.debug "更新成功しました！！！！！！！"
      flash[:notice] = "更新成功しました"
      redirect_to user_path(current_user.id)
    else
      logger.debug "更新失敗しました！！！！！！！"
      user.errors.full_messages.each do |m|
        logger.debug m
      end
      flash[:notice] = "更新失敗しました"
      render user_path(current_user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduce, :password, :password_confirmation, :image)
  end
end
