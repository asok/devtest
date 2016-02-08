require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  describe 'generating access_token' do
    it 'generates a token before creating' do
      subject.save!
      expect(subject.token).to be_present
    end
  end
end
