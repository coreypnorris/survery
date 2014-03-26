class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.column :description, :string
      t.column :question_id, :int

      t.timestamps
    end
  end
end
