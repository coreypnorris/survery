class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.column :survey_id, :int
      t.column :taker_id, :int

      t.timestamps
    end
  end
end
