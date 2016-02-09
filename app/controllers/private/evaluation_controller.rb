class Private::EvaluationController < Private::ApplicationController
  before_action :validate_params

  def create
    render json: {price: total_price}
  end

  protected

  def total_price
    params[:locations].reduce(0) do |sum, location| 
      sum += location[:panel_size].to_i * panel_price
    end
  end

  def panel_price
    Evaluation.call(validation.panel_provider.evaluation_type)
  end

  def validation
    @validation ||= Validation.new(params)
  end

  def validate_params
    render json: validation.error, status: 400 unless validation.valid?
  end
end
