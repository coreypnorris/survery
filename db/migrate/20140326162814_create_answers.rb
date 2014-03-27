class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.column :question_id, :int
      t.column :choice_id, :int
      t.column :taker_id, :int

      t.timestamps
    end
  end
end
