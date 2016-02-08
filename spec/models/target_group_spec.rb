require 'rails_helper'

RSpec.describe TargetGroup, type: :model do
  it{ should have_and_belong_to_many :countries }
  it{ should belong_to :panel_provider }
  it{ should belong_to :parent }

  describe '::for_country' do
    let(:panel_provider1) { PanelProvider.create!(code: 'x') }
    let(:panel_provider2) { PanelProvider.create!(code: 'y') }
    let(:target_group1) {
      TargetGroup.create!(panel_provider: panel_provider1) do |group| 
        group.countries << country1
      end
    }
    let(:target_group2) {
      TargetGroup.create!(panel_provider: panel_provider2) do |group| 
        group.countries << country2
      end
    }
    let(:country1) {
      Country.create!(country_code: 'PL',
                      panel_provider: panel_provider1)
    }
    let(:country2) {
      Country.create!(country_code: 'DE',
                      panel_provider: panel_provider2)
    }

    it{ expect(described_class.for_country('PL')).to eq([target_group1]) }
  end
end
