class PanelProvider < ActiveRecord::Base
  has_many :countries

  ValidEvaluationTypes = Evaluation.constants.select do |c|
    Class === Evaluation.const_get(c)
  end.map(&:to_s)

  validates_inclusion_of :evaluation_type, in: ValidEvaluationTypes

  before_validation :set_default_evaluation_type

  protected

  def set_default_evaluation_type
    self.evaluation_type ||= ValidEvaluationTypes.first
  end
end
