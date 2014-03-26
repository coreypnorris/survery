class UpdateTypeInQuestions < ActiveRecord::Migration
  def change
    change_column :questions, :type, :string
  end
end
