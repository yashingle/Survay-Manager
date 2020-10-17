class Survay < ActiveRecord::Base
  has_many :survay_responses, dependent: :delete_all
end
