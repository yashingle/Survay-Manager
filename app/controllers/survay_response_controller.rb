class SurvayResponseController < ApplicationController
  protect_from_forgery if: -> { request.format.json? }
  before_action :authenticate_user!
  def destroy
    begin
      survay_response = SurvayResponse.where(
        :id => params[:id],
        :group_id => current_user.group_id
      )
      survay_response.destroy_all if survay_response.present?
      render :json => {:data => "Deleted"}, :status => :ok
    rescue => exception
      puts exception
      render :json => {message: exception}, :status => 500
    end
  end
  
end
