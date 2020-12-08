class CreateProjectCases < ActiveRecord::Migration[6.0]
  def change
    create_table :project_cases do |t|

      t.timestamps
    end
  end
end
