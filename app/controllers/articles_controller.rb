class ArticlesController < ApplicationController
  def index 
    @articles = Articles.all
  end 

  def new
    @article = Articles.new 
  end 

  def show
    @article = Articles.find(params[:id])
  end 

  def create 
    @article = Articles.new(articles_param)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end 
  end 

  def edit 
    @article = Articles.find(params[:id])
  end 

  def update 
    @article = Articles.find(params[:id])
    @article.update(articles_param)
    @article.save
    redirect_to articles_path(@article)
  end 

  def destroy 
    @article = Articles.find(params[:id])
    @article.destroy 
    redirect_to articles_path
  end

  def articles_param
    params.require(:articles).permit(:title, :description)
  end 
end 