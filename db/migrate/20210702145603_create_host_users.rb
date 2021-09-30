class CreateHostUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :host_users do |t|

      t.references :user, foreign_key: true,  null: false
      t.string :position,  null: false, default: '管理者'
      t.string :image

      t.timestamps
    end
  end
end
