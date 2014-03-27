class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :description, :string
      t.column :survey_id, :int
      t.column :question_type, :string

      t.timestamps
    end
  end
end
