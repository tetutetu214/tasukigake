class CreateCompanyTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :company_types do |t|
      t.integer :industry_type_1, null: false
      t.integer :industry_type_2, null: false
      t.integer :industry_type_3, null: false
      t.references :company_detail ,foreign_key: true 
      t.timestamps
    end
  end
end
