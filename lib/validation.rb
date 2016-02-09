class Validation
  attr_accessor :params, :error

  def initialize(params)
    self.params, self.error = params, ""
  end

  def valid?
    begin
      validate
    rescue RuntimeError => e
      self.error = e.message
    end
    error.empty?
  end

  def country
    @country ||= Country.where(country_code: params[:country_code]).last
  end

  def panel_provider
    @panel_provider ||= country.panel_provider
  end

  protected

  def validate
    [:country_code, :target_group_id, :locations].each do |name| 
      raise "#{name} param has to be provided" if params[name].nil?
    end

    unless country.target_group_ids.include?(params[:target_group_id].to_i)
      raise "Invalid target_group_id"
    end

    unless param_location_ids.all?{ |id| country_location_ids.include? id }
      raise "Wrong location ids in params"
    end
  end

  def param_location_ids
    @param_location_ids ||= params[:locations].map{ |p| p[:id].to_i }
  end

  def country_location_ids
    @country_location_ids ||= country.locations.map(&:id)
  end
end
