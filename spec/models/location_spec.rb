require 'rails_helper'

RSpec.describe Location, type: :model do
  it{ should have_and_belong_to_many :location_groups }

  describe '::for_country' do
    let(:panel_provider1) { PanelProvider.create!(code: 'x') }
    let(:panel_provider2) { PanelProvider.create!(code: 'y') }
    let(:location1) {
      Location.create!(name: 'location1') do |location|
        location.location_groups << group1
      end
    }
    let(:location2) {
      Location.create!(name: 'location2') do |location|
        location.location_groups << group2
      end
    }
    let(:group1) {
      LocationGroup.create!(name: 'group1',
                            panel_provider: panel_provider1,
                            country: country1)
    }
    let(:group2) {
      LocationGroup.create!(name: 'group2',
                            panel_provider: panel_provider2,
                            country: country2)
    }
    let(:country1) {
      Country.create!(country_code: 'PL',
                      panel_provider: panel_provider1)
    }
    let(:country2) {
      Country.create!(country_code: 'DE',
                      panel_provider: panel_provider2)
    }

    it{ expect(described_class.for_country('PL')).to eq([location1]) }
  end
end
