class CreatePresentations < ActiveRecord::Migration
  def self.up
    create_table :presentations do |t|
      t.references :meeting
      t.string :speaker
      t.string :collaborator
      t.string :affiliation
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :presentations
  end
end
