require 'rails_helper'

RSpec.describe Private::LocationsController do
  describe 'GET locations/:country_code' do
    context 'authenticated', authenticated: true do
      include_examples :locations_index
    end

    include_examples :unauthenticated do
      before{ get :index, country_code: 'PL' }
    end
  end
end
