class CreateBarangs < ActiveRecord::Migration
  def change
    create_table :barangs do |t|
      t.date :date
      t.string :namabarang
      t.integer :jumlah
      t.float :harga
      t.float :totalharga

      t.timestamps null: false
    end
  end
end
