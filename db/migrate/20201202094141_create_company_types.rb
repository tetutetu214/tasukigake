class CreateCompanyTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :company_types do |t|
      t.text :industry_type, null: false
      t.references :user ,foreign_key: true 
      t.timestamps
    end
  end
end
