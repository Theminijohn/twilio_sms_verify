class PhoneVerificationService
  attr_reader :user

  def initialize(options)
    @user = User.find(options[:user_id])
  end

  def process
    send_sms
  end

private

  def to
    user.phone_number
  end

  def body
    "Please reply with this code: '#{user.phone_verification_code}' to
    verify your phone number."
  end

  def twilio_client
    @twilio ||= Twilio::REST::Client.new
  end

  def send_sms
    Rails.logger.info "SMS: To: #{to} Body: \"#{body}\""

    twilio_client.account.messages.create(
      from: Settings.twilio.app_number,
      to: to,
      body: body
    )
  end
end