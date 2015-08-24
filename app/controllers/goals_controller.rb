class GoalsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
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
    if @goal.save
      redirect_to goals_url
    else
      flash[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
    render :edit
  end

  def show
    @goal = Goal.find(params[:id])
    render :show
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      render :show
    else
      flash[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to goals_url
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :body, :goal_type, :is_completed)
  end

  def require_same_user
    @goal = Goal.find(params[:id])
    if current_user.id != @goal.user_id
      flash[:errors] = ["You do not have permission for that action"]
      redirect_to goals_url
    end
  end

end
