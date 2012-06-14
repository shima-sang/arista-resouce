class Project < ActiveRecord::Base
  has_many :actual_working_time
  
  attr_accessible :badget, :project_end_date, :project_name, :project_start_date
end
