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
    Evaluation.call(panel_provider.evaluation_type)
  end

  def panel_provider
    @panel_provider ||= country.panel_provider
  end

  def country
    @country ||= Country.where(country_code: params[:country_code]).last
  end

  def validate_params
    render nothing: true, status: 400 if invalid_params?
  end

  def invalid_params?
    [params[:country_code], params[:target_group_id], params[:locations]].any?(&:nil?)
  end
end
