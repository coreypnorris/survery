class AddTypeToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :type, :int
  end
end
