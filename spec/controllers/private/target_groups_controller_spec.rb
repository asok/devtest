require 'rails_helper'

RSpec.describe Private::TargetGroupsController do
  describe 'GET target_groups/:country_code' do
    context 'authenticated', authenticated: true do
      include_examples :target_groups_index
    end

    include_examples :unauthenticated do
      before{ get :index, country_code: 'PL' }
    end
  end
end
