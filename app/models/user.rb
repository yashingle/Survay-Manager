class User < ActiveRecord::Base
 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :group
  has_many :one_time_keys
  has_many :survays
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :create_group, :create_api_token

  def create_api_token
    api_token = Devise.friendly_token
    self.update_attribute(:api_token, api_token)
  end

  def create_group
    g = Group.create
    self.update_attribute(:group_id, g.id)
  end

  def self.find_by_one_time_api_token(one_time_token)
    one_time_key = OneTimeApiKey.where(:one_time_api_key => one_time_token).first
    return [one_time_key.try!(:user), one_time_key]
  end
end
