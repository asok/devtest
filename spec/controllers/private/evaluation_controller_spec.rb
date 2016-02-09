require 'rails_helper'

RSpec.describe Private::EvaluationController do
  describe 'POST /evaluate_target' do
    context 'authenticated', authenticated: true do
      let!(:panel_provider) {
        PanelProvider.create!(code: 'x')
      }
      let!(:country) {
        Country.create!(country_code: 'PL', panel_provider: panel_provider)
      }
      let!(:location) {
        Location.create(name: 'a location')
      }
      let!(:location_group) {
        LocationGroup.create!(name: 'Poland',
                              country: country,
                              panel_provider: panel_provider).tap do |group|
          group.locations << location
        end
      }
      let!(:target_group) {
        TargetGroup.create!(name: 'Polish',
                            panel_provider: panel_provider).tap do |group|
          group.countries << country
        end
      }

      context 'some params are missing' do
        it 'renders 400' do
          post :create, country_code: country.country_code, locations: []
          expect(response.status).to eq(400)
        end
      end

      context 'all params are present' do
        context 'the locations are empty' do
          it 'returns 0' do
            post :create,
                 country_code: country.country_code,
                 locations: [],
                 target_group_id: target_group.id
            expect(response.body).to eq({price: 0}.to_json)
          end
        end

        context 'the locations are not empty' do
          it 'returns the total price' do
            post :create,
                 country_code: country.country_code,
                 locations: [{id: location.id, panel_size: 200}],
                 target_group_id: target_group.id

            #the spec is making the real GET request so the price is variadic
            #the ideal would be to use vcr gem to stub the GET request
            expect(response.body).to match(/\A{"price":[0-9]+}\Z/)
          end
        end
      end
    end
  end
end
