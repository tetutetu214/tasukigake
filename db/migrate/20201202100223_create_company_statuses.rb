class CreateCompanyStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :company_statuses do |t|
      t.integer :status, null: false
      t.integer :insurance
      t.text :license
      t.text :tool 
      t.text :companies_pr
      t.references :user ,foreign_key: true     
      t.timestamps
    end
  end
end