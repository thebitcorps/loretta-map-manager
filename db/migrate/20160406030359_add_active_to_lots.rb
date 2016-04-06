class AddActiveToLots < ActiveRecord::Migration
  def change
    add_column :lots, :active, :bool, default: false
  end
end
