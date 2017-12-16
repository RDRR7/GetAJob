class CreateUserInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_informations do |t|
      t.string :name
      t.string :contact
      t.string :about_me
      t.integer :age
      t.integer :gender
      t.integer :education
      t.boolean :status, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
