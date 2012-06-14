class CreateActualWorkingTimes < ActiveRecord::Migration
  def change
    create_table :actual_working_times do |t|
      t.references :user
      t.references :project
      t.date :actual_working_date
      t.float :actual_manhour
	  t.string :actual_working_times_other
      t.timestamps
    end
  end
end
