# Settings for miscela app
Rails.configuration.event_name = "Miscela Rock Festival"
Rails.configuration.event_code = "mrf12"

# openid login through janrain
Rails.configuration.janrain_auth_url = "https://rpxnow.com/api/v2/auth_info"
Rails.configuration.janrain_api_key = ENV['janrain_api_key']

# paperclip-dropbox
Rails.configuration.dropbox = {
  'app_key' => ENV['dropbox_app_key'],
  'app_secret' => ENV['dropbox_app_secret'],
  'access_token' => ENV['dropbox_access_token'],
  'access_token_secret' => ENV['dropbox_access_token_secret'],
  'user_id' => ENV['dropbox_user_id'],
  'access_type' => "app_folder"
}
