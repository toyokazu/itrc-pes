class CreateEvaluations < ActiveRecord::Migration
  def self.up
    create_table :evaluations do |t|
      t.references :presentation
      t.string :valuator
      t.timestamp :date
      t.float :presentation_allotment
      t.float :presentation_story
      t.float :speaker_wording
      t.float :degree_of_understanding
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :evaluations
  end
end
