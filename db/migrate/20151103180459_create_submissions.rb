class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :problem_id
      t.integer :contest_id
      t.string :result
      t.string :runtime
      t.integer :memory
      t.string :language

      t.timestamps null: false
    end
  end
end
