class Country < ActiveRecord::Base
  has_many :location_groups
  has_many :locations, through: :location_groups
  belongs_to :panel_provider
  has_and_belongs_to_many :target_groups, ->{ where parent_id: nil }
end
