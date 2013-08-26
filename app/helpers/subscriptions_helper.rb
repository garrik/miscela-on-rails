module SubscriptionsHelper
  def download_file(file, name)
    send_file file.path, :type => file.content_type, :disposition => 'attachment'
  end
end
