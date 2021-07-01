class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
    @status = TaskState.find(@task.status)
  end

  def destroy
    task = Task.find(params[:id])
    goal_id = task.goal_id
    if task.destroy
      redirect_to goal_path(goal_id), notice: "目標を削除しました。"
    end
  end
end
