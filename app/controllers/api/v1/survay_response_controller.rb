class Api::V1::SurvayResponseController < ApplicationController
  before_filter :authenticate_api, only: [:create, :update, :destroy]
  protect_from_forgery :except => [:index, :update, :destroy, :create]
  before_filter :check_params, only: [:create]
  def index
  end

  def create
    begin
      survay = Survay.where(:id => params[:survay_id], :group_id => params[:current_user].group_id)
      (render :json => {:message => "Not Authorized!"}, :status => :unauthorized ) and return unless survay.present?
      SurvayResponse.create({
        :points => params['points'],
        :response => params['response'],
        :survay_id => params['survay_id'],
        :additional_info => params['additional_info'],
        :user_id => params['current_user'].id,
        :group_id => params['current_user'].group_id
      })
      # params[:one_time_api_key].destroy
      render :json => {:message => "Response Saved"}, :status => :ok
    rescue ActiveModel::ForbiddenAttributesError  => e
      render :json => {:message => "Missing Attributes#{e.backtrace}"}, :status => :unprocessable_entity
    rescue Exception => e
      render :json => {:message => "Something went wrong#{e}"}, :status => 500
    end
  end

  def update
    render :json => {}, :status => 200
  end

  private

  def check_params
    puts params
    params.except(:current_user, :response, :points, :survay_id, :additional_info)
  end
end
