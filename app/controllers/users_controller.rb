class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:edit, :destroy]}

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

    if user&.authenticate("testtest")
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
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    user = User.find_by(id: session[:user_id])
    if user.update(user_params)
      flash[:notice] = "更新成功しました"
      redirect_to user_path(current_user.id)
    else
      flash[:notice] = "更新失敗しました"
      render user_path(current_user.id)
    end
  end

  def following
    @user = User.find(params[:id])
  end

  def followers
    @user = User.find(params[:id])
    @follows = Relationship.where(followed_id: params[:id])
  end

  def setting
    @user = User.find(session[:user_id])
  end

  def destroy
    user = User.find(session[:user_id])
    if user.destroy
      session[:user_id] = nil
      flash[:notice] = "アカウント削除しました"
      redirect_to goals_path
    else
      flash[:notice] = "アカウント削除できませんでした"
      render user_path(current_user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduce, :password, :password_confirmation, :image)
  end
end
