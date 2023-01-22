class ArticlesController < ApplicationController
  def index 
    @articles = Articles.all
  end 

  def new
    @article = Articles.new 
  end 

  def create 
    @article = Articles.new(articles_param)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end 
  end 

  def articles_param
    params.require(:articles).permit(:title, :description)
  end 
end 