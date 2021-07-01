class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to goal_path(comment.goal_id)
    else
      render goal_path(comment.goal_id)
    end
  end

  def edit
    # comment = Comment.new(comment_params)
    # if comment.save
    #   redirect_to goal_path(params[:goal_id])
    # else
    #   render goal_path(params[:goal_id])
    # end
  end

  def destroy
    comment = Comment.find(params[:id])
    goal_id = comment.goal.id
    if comment.destroy
      redirect_to goal_path(goal_id), notice: "コメントを削除しました。"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :goal_id, :comment)
  end
end
