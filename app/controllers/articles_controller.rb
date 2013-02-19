class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def create
    #render :text => params.inspect
    
    #do it manually
    #Article.new
    #Article.save 
    
    Article.create params[:article]
    redirect_to :back
  end
  
end
