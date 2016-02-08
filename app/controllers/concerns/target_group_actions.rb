module TargetGroupActions
  extend ActiveSupport::Concern

  included do
    def index
      render json: TargetGroup.for_country(params[:country_code])
    end
  end
end
