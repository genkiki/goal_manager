class CommentsController < ApplicationController
  before_action :set_comment, {only: [:update, :destroy]}
  def create
    logger.debug "called create"
    logger.debug "params[:goal_id]:#{params[:goal_id]}"
    logger.debug "params[:user_id]:#{params[:user_id]}"
    comment = Comment.new(comment_params)
    goal = Goal.find(comment.goal_id)
    # goal = comment.goal
    logger.debug "goal.id:#{goal.id}"

    if comment.save
      goal.save_notification_comment!(current_user, comment)
      redirect_to goal_path(comment.goal_id)
    else
      render goal_path(comment.goal_id)
    end
  end

  def update
    @comment.update!(comment_params)
    render json: @comment
  end

  def destroy
    comment = Comment.find(params[:id])
    goal_id = comment.goal.id
    if comment.destroy
      redirect_to goal_path(goal_id), notice: "コメントを削除しました。"
    end
  end

  private

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :goal_id, :comment)
  end
end
