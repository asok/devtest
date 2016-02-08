class AddEvaluationType < ActiveRecord::Migration
  def change
    add_column :panel_providers, :evaluation_type, :string
  end
end
