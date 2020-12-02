class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :company_name, null: false
      t.string :postal_code , null: false
      t.integer :prefecture_id, null: false
      t.string :company_city
      t.string :company_address
      t.references :user ,foreign_key: true 
      t.timestamps
    end
  end
end
