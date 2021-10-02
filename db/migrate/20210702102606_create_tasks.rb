class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      
      # t.references :request, type: :bigint, foreign_key: true,  null: false
      # t.references :hostUser, foreign_key: true,  null: false
      t.references :request, null: false, type: :bigint, foreign_key: true
      t.references :host_user, null: false
      t.text :comment, null: false
      t.boolean :isAccepted,  null: false
      t.boolean :isDone, default: false
      # t.integer :follower

      t.timestamps
    end
  end
end


