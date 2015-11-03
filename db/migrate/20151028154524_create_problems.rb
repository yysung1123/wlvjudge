class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.integer :judge_id
      t.string :title
      t.string :source

      t.timestamps null: false
    end
  end
end
