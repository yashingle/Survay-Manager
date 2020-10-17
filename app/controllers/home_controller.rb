class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @survays = Survay.where(:group_id => current_user.group_id).includes(:survay_responses)
    @total_responses = 0
    @survays.each{|s| @total_responses += s.survay_responses.count}
  end

  def survays
    @offset = params['page-index'].to_i rescue 1
    @offset = 1 if @offset <= 0
    @survays = Survay.where(:group_id => current_user.group_id).offset((@offset-1)*10).limit(10)
  end

  def survay
    @offset = params['page-index'].to_i rescue 1
    @offset = 1 if @offset <= 0
    @survay = Survay.where(:id => params[:id], :group_id => current_user.group_id).includes(:survay_responses).first
  end

  def survay_response
    @offset = params['page-index'].to_i rescue 1
    @offset = 1 if @offset <= 0
    @survay_responses = SurvayResponse.where(:group_id => current_user.group_id).offset((@offset-1)*10).limit(10).order("id desc")
  end

  def profile
    @all_users = User.where(:group_id => current_user.group_id)
  end

end
