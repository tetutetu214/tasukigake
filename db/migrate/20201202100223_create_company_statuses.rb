class CreateCompanyStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :company_statuses do |t|
      t.integer :prefecture_id, null: false
      t.integer :insurance_1
      t.integer :insurance_2
      t.integer :insurance_3
      t.integer :license_id
      t.integer :tool_id
      t.text    :companies_pr
      t.references :company_correspondence ,foreign_key: true    
      t.timestamps
    end
  end
end