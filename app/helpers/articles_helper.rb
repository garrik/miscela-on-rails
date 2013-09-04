module ArticlesHelper
  def article_url(article)
    application_url() + article_path(article)
  end

  def signed_in_user
    redirect_to signin_path, notice: "Perfavore eseguire l'accesso al sito con username e password" unless signed_in?
  end
end
