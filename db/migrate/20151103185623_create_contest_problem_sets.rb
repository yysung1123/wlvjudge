class CreateContestProblemSets < ActiveRecord::Migration
  def change
    create_table :contest_problem_sets do |t|

      t.timestamps null: false
    end
  end
end
