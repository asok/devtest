require 'rails_helper'

RSpec.describe PanelProvider, type: :model do
  it{ should have_many :countries }

  it{ should validate_inclusion_of(:evaluation_type).
              in_array(["Letters", "Tags", "Nodes"]) }
end
