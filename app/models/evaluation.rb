class Evaluation < ActiveRecord::Base
  belongs_to :presentation

  MAX_SCORE = 5.0
  MIN_SCORE = 1.0

  def self.score_explanation
    "悪 (#{MIN_SCORE.to_i}) ー 良 (#{MAX_SCORE.to_i})"
  end

  def self.score_attributes
    %w[ presentation_length presentation_allotment presentation_story presentation_completeness material_legibility loudness_and_clearness degree_of_understanding speaker_wording speaker_manner ]
  end

  def self.array_columns
    %w[ comments ]
  end

  def total_score
    score = 0
    score_attr_list = self.attributes.keys.select {|attr| Evaluation.score_attributes.include?(attr) }
    score_attr_list.each do |attribute_name|
      score = score + self.send(attribute_name)
    end
    score = score * 1.0 / score_attr_list.size
    score
  end
end
