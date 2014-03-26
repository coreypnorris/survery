class AddTakerIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :taker_id, :int
  end
end
