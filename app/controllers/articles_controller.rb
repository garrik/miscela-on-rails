class ArticlesController < ApplicationController
  include ArticlesHelper
  before_filter :signed_in_user, only: [ :create, :new, :edit, :preview, :update, :destroy ]
  
  def index
    @article = Article.new
    @articles = Article.paginate(page: params[:page], per_page: 10).order("created_at desc")
  end

  def headlines
    @articles = Article.find(:all, order: "created_at desc", limit: 5)
    @headlines_container = { :headlines => Array.new }
    @articles.each do |article|
      @headlines_container[:headlines].push({ :id => article.id, :url => article_path(article.id), :title => article.title, :content => article.content })
    end
    render "headlines", :formats => [:json], :layout => false
    #render :partial => "articles/headlines", :formats => [:json]
  end
  def rss_feeds
    @articles = Article.find(:all, order: "created_at desc", limit: 10)
    render "rss_feeds", :formats => [:xml], :layout => false
    #render :partial => "articles/rss_feeds", :formats => [:xml]
  end
  
  def show
    @article = Article.find params[:id]
  end

  def create
    #render :text => params.inspect
    
    @article = Article.create(params[:article].merge(:author => current_user.userid))
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
  end

  def edit
    @article = Article.find params[:id]    
  end

  def preview
    @article = Article.find params[:id]    
  end

  def update
    @article = Article.find params[:id]
    if @article.update_attributes params[:article].merge(:author => current_user.userid)
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
