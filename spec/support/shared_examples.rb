RSpec.shared_examples_for :unauthenticated do
  context 'unauthenticated' do
    it 'returns 401' do
      expect(response.body).to match('HTTP Token: Access denied.')
      expect(response.status).to eq 401
    end
  end
end

RSpec.shared_examples_for :locations_index do
  let(:location) { Location.new(name: 'index-spec') }

  it 'returns locations which belong to the country and its panel provider', authenticated: true do
    allow(Location).to receive(:for_country).with('PL'){ [location] }

    get :index, country_code: 'PL'
    expect(response.body).to eq([location].to_json)
  end
end

RSpec.shared_examples_for :target_groups_index do
  let(:target_group) { TargetGroup.new(name: 'index-spec') }

  it 'returns target groups which belong to the country and its panel provider' do
    allow(TargetGroup).to receive(:for_country).with('PL'){ [target_group] }

    get :index, country_code: 'PL'
    expect(response.body).to eq([target_group].to_json)
  end
end
