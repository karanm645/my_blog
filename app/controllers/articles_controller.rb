class ArticlesController < ApplicationController
  def index 
    @articles = Article.all.reload
  end 
  
  def show
    @article = Article.find_by(params[:user_id])
    @user = current_user
    @article.user = @user 
  end 

  def new
    @article = Article.new
    @user = current_user
    # @user = User.find_by(params[:id])
  end 


  def create 
    @article = Article.new(articles_param)
    @user = current_user
    @article.user = @user
    if @article.save
      redirect_to articles_path and return
    else 
      render :new
    end
  end

  def edit 
    @article = Article.find(params[:id])
  end 

  def update 
    @article = Article.find(params[:id])
    @article.update(articles_param)
    @article.save
    redirect_to articles_path(@article)
  end 

  def destroy 
    @article = Article.find(params[:id])
    if @article.user == current_user
      @article.destroy
      redirect_to articles_path
    else 
      redirect_to articles_path
      flash[:alert] = "You are not authorzied to delete this article"
    end 
  end

private
  def articles_param
    params.require(:articles).permit(:title, :description)
  end  
end 