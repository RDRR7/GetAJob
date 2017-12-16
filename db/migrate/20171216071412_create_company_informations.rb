class CreateCompanyInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :company_informations do |t|
      t.string :name
      t.string :contact
      t.string :description
      t.string :location
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
