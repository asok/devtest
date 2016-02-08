module LocationActions
  extend ActiveSupport::Concern

  included do
    def index
      render json: Location.for_country(params[:country_code])
    end
  end
end
