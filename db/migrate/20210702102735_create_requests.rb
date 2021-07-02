class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|

      # 設定できるもの
      # string     : 文字列
      # text       : 長い文字列
      # integer    : 整数
      # float      : 浮動小数
      # decimal    : 倍精度小数
      # datetime   : 日時
      # timestamp  : タイムスタンプ
      # timestamps : created_at, updated_at
      # time       : 時間
      # date       : 日付
      # binary     : バイナリデータ
      # boolean    : Boolean

      t.string :title,  null: false
      t.text :message,  null: false
      t.boolean :isChecked
      t.integer :good
      t.binary :image

      t.timestamps
    end
  end
end


