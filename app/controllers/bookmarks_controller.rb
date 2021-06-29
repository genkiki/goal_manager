class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.new(goal_id: params[:goal_id])
    if bookmark.save
      flash[:notice] = "ブックマーク登録しました"
    else
      flash[:notice] = "ブックマーク登録失敗しました"
    end
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(goal_id: params[:goal_id])
    if bookmark.destroy
      flash[:notice] = "ブックマーク登録解除しました"
    else
      flash[:notice] = "ブックマーク登録解除失敗しました"
    end
  end
end
