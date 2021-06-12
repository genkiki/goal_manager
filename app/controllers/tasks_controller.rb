class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
  end

  def destroy
    task = Task.find(params[:id])
    goal_id = task.goal_id
    if task.destroy
      redirect_to goal_path(goal_id), notice: "目標を削除しました。"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task.udpate!(task_params)
    redirect_to task_path(@task.id), notice: "課題を更新しました。"
  end

  private
  def task_params
    params.require(:task).permit(:content, :action, :start_date, :end_date, :status)
  end
end
