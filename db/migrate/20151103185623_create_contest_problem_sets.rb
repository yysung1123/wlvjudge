class CreateContestProblemSets < ActiveRecord::Migration
  def change
    create_table :contest_problem_sets do |t|
      t.integer :contest_id
      t.integer :problem_id
      t.integer :judge_id
      t.string :source

      t.timestamps null: false
    end
  end
end
