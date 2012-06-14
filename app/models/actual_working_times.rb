class ActualWorkingTimes < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  
  # attr_accessible :title, :body
  attr_accessible :user_id, :project_id, :actual_working_date, :actual_manhour
end
