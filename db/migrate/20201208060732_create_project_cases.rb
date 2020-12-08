class CreateProjectCases < ActiveRecord::Migration[6.0]
  def change
    create_table :project_cases do |t|
      t.string :project_case_name  , null: false
      t.integer :project_address_prefecture_id, null: false
      t.string :project_address_city
      t.string :project_address_address
      t.text :project_case_pr, null: false
      t.references :company ,foreign_key: true 

      t.timestamps
    end
  end
end
