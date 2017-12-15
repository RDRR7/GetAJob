class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :description
      t.integer :age
      t.integer :gender
      t.integer :education
      t.references :company, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
