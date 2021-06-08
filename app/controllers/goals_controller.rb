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

  def destroy
    goal = Goal.find(params[:id])
    if goal
      goal.destroy
      redirect_to goals_path, notice: "目標を削除しました。"
    end
  end
end
