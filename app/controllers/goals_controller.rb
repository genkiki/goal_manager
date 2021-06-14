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
    # @new_goal = Goal.new(user_id: 1, # for develop
    #                     result: "3" )
    # @new_goal = Goal.new
    @goal = Goal.new
    @task = @goal.tasks.build
  end

  def create
    # new_goal = Goal.new(content: params[:goal_content],
    #                       user_id: 1, # for develop
    #                       result: "3",
    #                       start_date: params[:goal_start_date],
    #                       end_date: params[:goal_end_date])
    @goal = Goal.new(goal_params)

    if @goal.save
      logger.debug "保存成功しました!!!!!!!!"
      redirect_to "/", notice: "目標を作成しました"
    else
      logger.debug "保存失敗しました!!!!!!!!"
      logger.debug @goal.errors.full_message
      render new_goal_path
    end

    # if new_goal.save
    #   new_task = Task.new(goal_id: new_goal.id,
    #                       user_id: 1, # for develop
    #                       content: params[:task_content],
    #                       status: "予定",
    #                       action: params[:task_action],
    #                       start_date: params[:task_start_date],
    #                       end_date: params[:task_end_date])
    #   if new_task.save
    #     redirect_to "/", notice: "目標を作成しました"
    #   else
    #     flash[:notice] = "課題作成か失敗しました"
    #     render new_goal_path
    #   end
    # else
    #   flash[:notice] = "目標作成が失敗しました"
    #   render new_goal_path
    # end
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
                                  tasks_attributes: [:id, :content, :action, :start_date, :end_date, :status, :_destroy])
                          .merge(user_id: 1,# for develop
                                  tasks_attributes: [user_id: 1])# for develop
  end
end
