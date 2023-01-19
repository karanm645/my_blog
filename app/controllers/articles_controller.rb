class ArticlesController < ApplicationController
  def index 
    @articles = Articles.all
  end 

  def new
    @article = Articles.new 
  end 

  def create 
    @article = Articles.new(articles_param)
    @article.save
    
    redirect_to articles_path
  end 

  def articles_param
    params.require(:articles).permit(:title, :description)
  end 
end 