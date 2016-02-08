# coding: utf-8
ApiKey.create!

provider1 = PanelProvider.create!(code: 'a', evaluation_type: 'Letters')
provider2 = PanelProvider.create!(code: 'b', evaluation_type: 'Tags')
provider3 = PanelProvider.create!(code: 'c', evaluation_type: 'Nodes')

pl = Country.create!(country_code: 'PL', panel_provider: provider1)
de = Country.create!(country_code: 'DE', panel_provider: provider2)
fr = Country.create!(country_code: 'FR', panel_provider: provider3)

location_create = ->(name) do
  Location.create!(name: name)
end

LocationGroup.create!(name: 'West Poland',
                      country: pl,
                      panel_provider: provider1).tap do |group|
  group.locations = %w[Poznań Lubuskie Katowice Sosnowiec Wrocław].map(&location_create)
end
LocationGroup.create!(name: 'East Poland',
                      country: pl,
                      panel_provider: provider1).tap do |group|
  group.locations = %w[Lublin Białystok Zamość Rzeszów].map(&location_create)
end
LocationGroup.create!(name: 'Germany',
                      country: de,
                      panel_provider: provider2).tap do |group|
  group.locations = %w[Berlin Munich Frankfurt Saxony Bamberg].map(&location_create)
end
LocationGroup.create!(name: 'France',
                      country: fr,
                      panel_provider: provider3).tap do |group|
  group.locations = %w[Paris Lyon Britain Alsace Bordeaux Nicea].map(&location_create)
end

root1 = TargetGroup.create!(name: 'Polish from West Poland',
                            panel_provider: provider1)
root2 = TargetGroup.create!(name: 'Polish from East Poland',
                            panel_provider: provider1)
root3 = TargetGroup.create!(name: 'German',
                            panel_provider: provider2)
root4 = TargetGroup.create!(name: 'French',
                            panel_provider: provider3)

[root1, root2, root3, root4].each do |root|
  3.times do |i|
    TargetGroup.create!(parent: root,
                        name: "Descendant of #{i} level of #{root.name}",
                        panel_provider: root.panel_provider)
  end
end
