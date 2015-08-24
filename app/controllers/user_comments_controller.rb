class UserCommentsController < ApplicationController
  def new
    @user_comment = UserComment.new
  #  @user_id = params[:user_id]
    render :new
  end

  def create
    #@user_id = params[:user_id]
    @user_comment = current_user.authored_comments.create(user_comment_params)
    if @user_comment.save
      redirect_to user_url(params[:user_id])
    else
      flash[:errors] = @user_comment.errors.full_messages
      render :new
    end
  end

  def edit
    @user_comment = UserComment.find(params[:id])
    render :edit
  end

  def update
    @user_comment = UserComment.find(params[:id])
    if @user_comment.update(user_comment_params)
      redirect_to user_url(params[:user_id])
    else
      flash[:errors] = @user_comment.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user_comment = UserComment.find(params[:id])
    @user_comment.destroy
    redirect_to user_url(params[:user_id])
  end

  private
  def user_comment_params
    params.require(:user_comment).permit(:body).merge({user_id: params[:user_id]})
  end
end
