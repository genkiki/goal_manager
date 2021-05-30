class GoalsController < ApplicationController
  def index
    @q = Goal.ransack(params[:q])
    @goals = @q.result(distinct: true).includes(:user).page(params[:page]).per(10).recent
    @states = GoalState.all
  end
end
