class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.new(goal_id: params[:goal_id])
    goal = Goal.find(params[:goal_id])
    if bookmark.save
      flash[:notice] = "ブックマーク登録しました"
      goal.create_notification_bookmark!(current_user)
    else
      flash[:notice] = "ブックマーク登録失敗しました"
    end
    redirect_to goal_path(params[:goal_id])
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(goal_id: params[:id])
    if bookmark.destroy
      flash[:notice] = "ブックマーク登録解除しました"
    else
      flash[:notice] = "ブックマーク登録解除失敗しました"
    end
    redirect_to goal_path(params[:id])
  end
end
