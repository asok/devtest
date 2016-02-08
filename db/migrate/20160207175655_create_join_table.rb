class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :target_groups, :countries
  end
end
