class WebhooksController < ApplicationController

  protect_from_forgery except: :incoming_stripe_webhook

  # Be sure that the webhooks URL is configured with:
  # ?api_key=API_KEY

  def incoming_verification
    # API Check
    raise 'You shall not pass!' unless params[:api_key] == Settings.twilio.webhooks_api_key

    # Handle verification
    user = get_user_for_phone_verification
    user.mark_phone_as_verified! if user

    render nothing: true
  end

private

  def get_user_for_phone_verification
    phone_verification_code = params['Body'].try(:strip)
    phone_number            = params['From']

    condition = { phone_verification_code: phone_verification_code,
                  phone_number: phone_number }

    User.unverified_phones.where(condition).first
  end

end
