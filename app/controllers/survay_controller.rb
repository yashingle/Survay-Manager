class SurvayController < ApplicationController
  protect_from_forgery if: -> { request.format.json? }
  before_action :authenticate_user!
  def create
    begin
      survay = Survay.create(
        :title => params[:title],
        :detail => params[:detail],
        :user_id => current_user.id,
        :group_id => current_user.group_id
        )
      render :json => {:data => survay}, :status => :ok
    rescue => exception
      puts exception
      render :json => {message: exception}, :status => 500
    end
  end

  def destroy
    begin
      survay = Survay.where(
        :id => params[:id],
        :group_id => current_user.group_id
      )
      survay.destroy_all if survay.present?
      render :json => {:data => "Deleted"}, :status => :ok
    rescue => exception
      puts exception
      render :json => {message: exception}, :status => 500
    end
  end
  
end
