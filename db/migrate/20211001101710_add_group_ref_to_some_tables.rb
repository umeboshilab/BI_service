class AddGroupRefToSomeTables < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :group, foreign_key: true
    add_reference :tasks, :group, null: false, foreign_key: true
    add_reference :requests, :group, null: false, foreign_key: true
  end
end
