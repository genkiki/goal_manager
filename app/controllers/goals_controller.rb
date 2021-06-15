class GoalsController < ApplicationController
  def index
    @q = Goal.ransack(params[:q])
    @goals = @q.result(distinct: true).includes(:user).page(params[:page]).per(10).recent
    @states = GoalState.all
  end

  def show
    @goal = Goal.find(params[:id])
    @result = GoalState.find(@goal.result).state
  end

  def new
    @goal = Goal.new
    @task = @goal.tasks.build
    @current_user = User.find(1)
  end

  def create
    @current_user = User.find(1)
    @goal = @current_user.goals.new(goal_params)

    if @goal.save
      redirect_to "/", notice: "目標を作成しました"
    else
      render new_goal_path
    end
  end

  def destroy
    goal = Goal.find(params[:id])
    if goal.destroy
      redirect_to goals_path, notice: "目標を削除しました。"
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:content, :start_date, :end_date, :result,
                                  tasks_attributes: [:id, :user_id, :goal_id, :content, :action, :start_date, :end_date, :status, :_destroy])
  end
end
