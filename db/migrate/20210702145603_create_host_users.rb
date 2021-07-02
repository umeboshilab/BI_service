class CreateHostUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :host_users do |t|

      t.references :user, foreign_key: true,  null: false
      t.string :position,  null: false
      t.binary :image

      t.timestamps
    end
  end
end
