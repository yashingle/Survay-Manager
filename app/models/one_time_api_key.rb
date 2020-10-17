class OneTimeApiKey < ActiveRecord::Base
  belongs_to :user
  after_create :create_one_time_key

  def create_one_time_key
    api_token = Devise.friendly_token
    self.update_attribute(:one_time_api_key, api_token)
  end
end
