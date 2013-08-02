module ArticlesHelper
  def article_url(article)
    application_url() + article_path(article)
  end
end
