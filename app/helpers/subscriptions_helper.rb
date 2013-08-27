module SubscriptionsHelper
  def download_file(file, name)
    send_file file.path, :type => file.content_type, :disposition => 'attachment'
  end

  def smart_add_url_protocol(url)
    url = 'http://' + url unless url[/^http:\/\//] || url[/^https:\/\//]
    url
  end
end