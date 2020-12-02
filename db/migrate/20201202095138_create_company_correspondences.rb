class CreateCompanyCorrespondences < ActiveRecord::Migration[6.0]
  def change
    create_table :company_correspondences do |t|
      t.integer :prefecture_id, null: false
      t.references :company_type ,foreign_key: true 
      t.timestamps
    end
  end
end
