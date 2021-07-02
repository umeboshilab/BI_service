class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      
      # t.references :request, type: :bigint, foreign_key: true,  null: false
      # t.references :hostUser, foreign_key: true,  null: false
      t.references(:request, null: false, type: :bigint)
      t.references(:hostUser, null: false)
      t.text :comment
      t.boolean :isAccepted,  null: false
      t.boolean :isDone
      # t.integer :follower

      t.timestamps
    end
  end
end


