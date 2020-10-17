class Api::V1::OneTimeApiKeyController < ApplicationController
  before_action :authenticate_api_for_one_time_key, only: [:index]
  protect_from_forgery :except => [:create]

  def index
    one_time_api_key = OneTimeApiKey.new({:user_id => params[:current_user].id})
    one_time_api_key.save!
    render :json => {:one_time_api_token => one_time_api_key.one_time_api_key}, :status => :ok
  end

end
