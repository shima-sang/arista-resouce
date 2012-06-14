class ActualWorkingTimesController < ApplicationController

    # show actual working time on project
    def index
	   @actual_working_times = ActualWorkingTimes.find(:all,
	                                                   :include => [:user, :project],
													   :conditions => ['user_id = :user_id', {:user_id => session[:user].id}],
													   :order => 'actual_working_date ASC')
    end
	
	# report actual working time on project
	def new
	  if params[:id]
 	    @actual_working_time = ActualWorkingTimes.find(params[:id])
      else
 	    @actual_working_time = ActualWorkingTimes.new	    
	  end

      @projects = Project.all
	  @users = User.all

	end
	
	def create
	  params[:actual_working_times][:user_id] = session[:user].id
 	  @actual_working_time = ActualWorkingTimes.new(params[:actual_working_times])
      @actual_working_time.save
	  
	  @actual_working_times = ActualWorkingTimes.find(:all, :include => [:user, :project], :conditions => ['user_id = :user_id', {:user_id => session[:user].id}])
	  render 'index'
	end
	
	def destroy
      @actual_working_time = ActualWorkingTimes.find(:first,
	                                                 :conditions => ['id = :id and user_id = :user_id', {:id => params[:id], :user_id => session[:user].id}])
      
      @actual_working_time.destroy if @actual_working_time
	  @actual_working_times = ActualWorkingTimes.find(:all, :include => [:user, :project], :conditions => ['user_id = :user_id', {:user_id => session[:user].id}])
	  render 'index'
  end
end
