class Private::ApplicationController < ApplicationController
  before_action :authenticate!

  def authenticate!
    authenticate_or_request_with_http_token do |token, options|
      ActiveSupport::SecurityUtils.secure_compare(ApiKey.last.token, token || '')
    end
  end
end
