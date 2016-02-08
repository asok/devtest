class ApiKey < ActiveRecord::Base
  before_create :generate_token

  private

  def generate_token
    loop do
      self.token = SecureRandom.hex
      break unless ApiKey.exists?(token: token)
    end
  end
end
