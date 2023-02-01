class ArticlesController < ApplicationController
  def index 
    @articles = Article.all.reload
  end 

  def new
    @article = Article.new
  end 

  def show
    @article = Article.find(params[:id])
  end 

  def create 
    @article = Article.new(articles_param)
    random_username = "#{SecureRandom.hex(3)}#{SecureRandom.hex(3)}"
    random_email = "#{SecureRandom.hex(3)}@example.com"
    @user = User.create!(username: random_username, email: random_email, password: "my password 2")
    @user.save 
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
    @article.destroy 
    redirect_to articles_path
  end

private
  def articles_param
    params.require(:articles).permit(:title, :description)
  end  
end 