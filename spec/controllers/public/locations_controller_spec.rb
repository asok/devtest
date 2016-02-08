require 'rails_helper'

RSpec.describe Public::LocationsController do
  describe 'GET locations/:country_code' do
    include_examples :locations_index
  end
end
