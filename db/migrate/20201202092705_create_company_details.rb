class CreateCompanyDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :company_details do |t|
      t.integer :division, null: false
      t.string :representative, null: false
      t.string :phone_number , null: false
      t.string :url
      t.numeric :capital     , null: false
      t.date :establishment   , null: false
      t.integer :employee, null: false
      t.text :description , null: false
      t.references :user ,foreign_key: true 
      t.timestamps
    end
  end
end
