class AddMaxToUsage < ActiveRecord::Migration
  def change
    add_column :usages, :max, :integer
  end
end
