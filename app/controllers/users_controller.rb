class UsersController < ApplicationController
  def index
    @users = User.all
    @article = Article.find_by(params[:user_id])
  end 
  
  def new 
    @user = User.new
  end 

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    # @article = Article.find_by(params[:user_id])
    if @user.save
      # flash[:success] = "Welcome to my blog #{@user.username}"
      redirect_to user_path(@user) and return
    else
      render 'new'
    end
  end 

  def edit
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save
    redirect_to articles_path
  end 
end 

private
def user_params
  params.require(:users).permit(:username, :email, :password)
end