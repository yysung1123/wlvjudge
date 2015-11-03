class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
