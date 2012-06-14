class User < ActiveRecord::Base
  has_many :actual_working_times
  
  attr_accessible :email, :name
end
