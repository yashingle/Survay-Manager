class Api::V1::DocsController < ApplicationController
  def index
    @api_token = "your_api_token"
    if current_user.present?
      @api_token = current_user.api_token
    end
  end

end
