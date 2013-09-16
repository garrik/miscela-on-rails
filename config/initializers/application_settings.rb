# Settings for miscela app
Rails.configuration.event_name = "Miscela Rock Festival"
Rails.configuration.event_code = "mrf12"

# openid login through janrain
Rails.configuration.janrain_auth_url = "https://rpxnow.com/api/v2/auth_info"
Rails.configuration.janrain_api_key = ENV['janrain_api_key']