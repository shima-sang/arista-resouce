class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.integer :badget
      t.date :project_start_date
      t.date :project_end_date

      t.timestamps
    end
  end
end
