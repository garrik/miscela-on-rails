class SubscriptionMailer < ActionMailer::Base
  default from: ENV['mail_from']

  def welcome_email(band_member, subscription)
    @member = band_member
    @subscription = subscription
    @event_name = Rails.configuration.event_name
    @url = "my_url"#url_for(controller: 'subscription_controller',
            #action: 'new',
            #only_path: false)
    mail(to: @member.email, subject: 'Ti sei iscritto al ' + @event_name)
  end
end
