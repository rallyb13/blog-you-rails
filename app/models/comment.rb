class Comment < ActiveRecord::Base
  belongs_to :post
  validates :content, :presence => true
  belongs_to :user
  before_create :send_sms

  private

    def send_sms
      response = RestClient::Request.new(
      :method => :post,
      :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
      :user => ENV['TWILIO_ACCOUNT_SID'],
      :password => ENV['TWILIO_AUTH_TOKEN'],
      :payload => {
        Body: "You have a new comment",
        To: self.post.user.phone,
        From: "9713202132" }
      ).execute
    end


end
