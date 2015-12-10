class CreateContestProblemSets < ActiveRecord::Migration
  def change
    create_table :contest_problem_sets do |t|
      t.integer :contest_id
      t.integer :problem_id

      t.timestamps null: false
    end
  end
end
