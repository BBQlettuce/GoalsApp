class GoalsController < ApplicationController
  def index
    @goals = Goal.where(goal_type: "public")
    render :index
  end

  # def user_index
  #   @goals = Goal.
  # end

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = current_user.goals.create(goal_params)
    if @goal
      render :index
    else
      render :new
    end
  end

  def edit

  end

  def show

  end

  def update

  end

  def destroy

  end

  private

  def goal_params
    params.require(:goal).permit(:body, :goal_type)
  end
end
