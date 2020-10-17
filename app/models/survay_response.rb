class SurvayResponse < ActiveRecord::Base
  belongs_to :survay
  serialize :additional_info
  scope :get_response_by_date, -> (date, current_user) { where(:created_at => (date.beginning_of_day..date.end_of_day),  :group_id => current_user.group_id) }
end
