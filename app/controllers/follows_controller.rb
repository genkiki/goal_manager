class FollowsController < ApplicationController
  def follow
    @user = User.find_by(id: session[:user_id])
    follow_ids = Follow.where(follow_user_id: session[:user_id])
    follow_users = follow_ids.users
  end

  def followed
    @user = User.find_by(id: session[:user_id])
    @follows = Follow.where(followed_user_id: session[:user_id])
  end
end
