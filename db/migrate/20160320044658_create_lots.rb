class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :number
      t.string :block
      t.string :satage
      t.decimal :square_meters
      t.string :status
      t.references :salesman, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
