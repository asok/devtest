class CreateTargetGroups < ActiveRecord::Migration
  def change
    create_table :target_groups do |t|
      t.text :name
      t.text :external_id
      t.references :parent, index: true, foreign_key: true
      t.text :secret_code
      t.references :panel_provider, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
