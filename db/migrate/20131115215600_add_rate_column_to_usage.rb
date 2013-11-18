class AddRateColumnToUsage < ActiveRecord::Migration
  def change
    add_column :usages, :rate, :float
  end
end
