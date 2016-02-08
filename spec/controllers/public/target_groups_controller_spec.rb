require 'rails_helper'

RSpec.describe Public::TargetGroupsController do
  describe 'GET target_groups/:country_code' do
    include_examples :target_groups_index
  end
end
