class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.text :token, index: true

      t.timestamps null: false
    end
  end
end
