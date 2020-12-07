class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.string :order_title , null: false
      t.integer :prefecture_id, null: false
      t.string :order_city
      t.string :order_address
      t.date :order_delivery_date_first   , null: false
      t.date :order_delivery_date_date_end   , null: false
      t.integer :industry_type, null: false
      t.integer :division, null: false
      t.integer :unit_price, null: false
      t.numeric :budget, null: false
      t.integer :payment_id, null: false
      t.text :order_pr, null: false
      t.references :user ,foreign_key: true 
      t.timestamps
    end
  end
end
