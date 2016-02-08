class CreateJoinTableLocationsLocationGroups < ActiveRecord::Migration
  def change
    create_join_table :locations, :location_groups
  end
end
