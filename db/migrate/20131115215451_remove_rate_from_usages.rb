class RemoveRateFromUsages < ActiveRecord::Migration
  def up
    remove_column :usages, :rate
  end

  def down
    add_column :usages, :rate, :integer
  end
end
