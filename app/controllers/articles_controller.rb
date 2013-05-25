class ArticlesController < ApplicationController
  before_filter :signed_in_user, only: [ :create, :new, :edit, :preview, :update, :destroy ]
  
  def index
    @article = Article.new
    @articles = Article.find(:all, :order => "id desc", :limit => 10)
  end

  def headlines
    @articles = Article.find(:all, :order => "id desc", :limit => 5)
    @headlines_container = { :headlines => Array.new }
    @articles.each do |article|
      @headlines_container[:headlines].push({ :id => article.id, :url => article_path(article.id), :title => article.title, :content => article.content })
    end
    respond_to do |format|
      #format.html 
      format.json { render :partial => "articles/headlines.json" }
    end
  end
  def rss_feeds
    @articles = Article.find(:all, :order => "id desc", :limit => 10)
    render :partial => "articles/rss_feeds.xml"  
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

  private
  def signed_in_user
    redirect_to signin_path, notice: "Perfavore eseguire l'accesso al sito con username e password" unless signed_in?
  end
end
