class TargetGroup < ActiveRecord::Base
  belongs_to :panel_provider
  belongs_to :parent, class_name: 'TargetGroup'
  has_and_belongs_to_many :countries

  scope :for_country, ->(country_code) do
    joins(:countries).
      where('countries.country_code = ?', country_code).
      where('countries.panel_provider_id = target_groups.panel_provider_id')
  end
end
