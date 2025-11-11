class CreateSchedules < ActiveRecord::Migration[7.2]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.string :memo
      t.boolean :done, default: false

      t.timestamps
    end
  end
  
end
