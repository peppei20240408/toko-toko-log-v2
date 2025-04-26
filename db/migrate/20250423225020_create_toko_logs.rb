class CreateTokoLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :toko_logs do |t|
      t.string  :title     , null: false
      t.text    :summary   , null: false
      t.integer :prefecture, null: false
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end