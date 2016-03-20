class CreateSalesmen < ActiveRecord::Migration
  def change
    create_table :salesmen do |t|
      t.string :name
      t.string :lastname

      t.timestamps null: false
    end
  end
end
