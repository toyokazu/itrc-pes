class Presentation < ActiveRecord::Base
  belongs_to :meeting
  has_many :evaluations

  def summary
    return nil if self.evaluations.size == 0
    summary = Evaluation.new
    # initialize attributes
    summary.presentation = self
    summary.attributes.keys.select {|attr| Evaluation.score_attributes.include?(attr) }.each do |attribute_name|
      summary.send(attribute_name + '=', 0.0)
    end
    Evaluation.array_columns.each do |attribute_name|
      summary.send(attribute_name + '=', [])
    end

    # summation of evaluations
    self.evaluations.each do |evaluation|
      summary.attributes.keys.select {|attr| Evaluation.score_attributes.include?(attr) }.each do |attribute_name|
        summary.send(attribute_name + '=', summary.send(attribute_name) + evaluation.send(attribute_name))
      end
      Evaluation.array_columns.each do |attribute_name|
        summary.send(attribute_name).push(evaluation.send(attribute_name))
      end
    end
    # calculate averages
    summary.attributes.keys.select {|attr| Evaluation.score_attributes.include?(attr) }.each do |attribute_name|
      summary.send(attribute_name + '=', summary.send(attribute_name) * 1.0 / self.evaluations.size)
    end
    summary
  end
end
