class CreateSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :supports do |t|

      t.string :support_title  , null: false
      t.integer :prefecture_id, null: false
      t.string :support_city
      t.string :support_address
      t.date :support_delivery_date_first   , null: false
      t.date :support_delivery_date_end   , null: false
      t.text :industry_type, null: false
      t.integer :support_person_id, null: false

      t.date :termination, null: false
      t.integer :feature, null: false
      t.numeric :budget, null: false
      t.text :support_pr, null: false
      t.references :user ,foreign_key: true 
      t.timestamps
    end
  end
end
