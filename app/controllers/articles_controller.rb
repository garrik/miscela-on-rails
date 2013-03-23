class ArticlesController < ApplicationController

  def index
    @article = Article.new
    @articles = Article.all
  end

  def headlines
    @articles = Article.find(:all, :order => "id desc", :limit => 5)
    respond_to do |format|
      #format.html 
      format.json { render :partial => "articles/headlines.json" }
    end
  end
  
  def show
    @article = Article.find params[:id]    
  end

  def create
    #render :text => params.inspect
    
    #do it manually
    #Article.new
    #Article.save

    
    @article = Article.create(params[:article].merge(:author => 'placeholder'))
    #@article = Article.new
    #@article.save
    if @article.errors.any?
      @errors= @article.errors
      #@errors.merge ({ :eccomi => 'eccomi' })
    end
    if @article.persisted?
      redirect_to preview_article_path(@article.id), :notice => 'Articolo creato'
    else
      redirect_to :back, :alert => 'Errore, articolo non creato'
    end
  end

  def new
    @article = Article.new
    #@errors ={ :eccomi => 'eccomi new' }
  end

  def edit
    @article = Article.find params[:id]    
  end

  def preview
    @article = Article.find params[:id]    
  end

  def update
    @article = Article.find params[:id]
    if @article.update_attributes params[:article].merge(:author => 'placeholder')
      if @article.errors.any?
        @errors= @article.errors
        #logger.debug @errors
      end
      if @article.draft == true
        redirect_to preview_article_path(@article.id), :notice => 'Articolo modificato'
      else
        redirect_to article_path(@article.id), :notice => 'Articolo pubblicato'
      end
    else
      redirect_to :back, :alert => 'Errore'
    end
  end
  
  def destroy
    Article.destroy params[:id]
    redirect_to :back, :notice => 'Articolo cancellato'
  end

end
