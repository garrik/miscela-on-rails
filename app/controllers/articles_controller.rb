class ArticlesController < ApplicationController
  def index
    @article = Article.new
    @articles = Article.all
  end
  
  def create
    #render :text => params.inspect
    
    #do it manually
    #Article.new
    #Article.save 
    
    article = Article.create params[:article]
    if article.persisted?
      redirect_to articles_path, :notice => 'Article created'
    else
      redirect_to :back, :notice => 'Error on article'
    end
  end

  def edit
    @article = Article.find params[:id]    
  end

  def update
    article = Article.find params[:id]
    if article.update_attributes params[:article]
      redirect_to articles_path, :notice => 'Article updated'
    else
      redirect_to :back, :notice => 'Error on article'
    end
  end
end
