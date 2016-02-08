class Location < ActiveRecord::Base
  has_and_belongs_to_many :location_groups
  has_many :countries, through: :location_groups

  scope :for_country, ->(country_code) do
    joins(:countries).
      where('countries.country_code = ?', country_code).
      where('countries.panel_provider_id = location_groups.panel_provider_id')
  end
end
