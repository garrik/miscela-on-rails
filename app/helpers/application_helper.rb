module ApplicationHelper
  # Return hostname as url 
  def application_url()
  	url = request.protocol + request.host
  	url += ':' + request.port.to_s unless request.port == 80
  end

  # Return page title on a per-page basis
  def page_title()
    content_for :page_title || "L'Associazione Miscela ti da il benvenuto sul suo sito ufficiale"
  end
end
