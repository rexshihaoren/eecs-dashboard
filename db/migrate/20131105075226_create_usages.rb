class CreateUsages < ActiveRecord::Migration
  def change
    create_table :usages do |t|
      t.string :user
      t.string :directory
      t.string :date
      t.integer :usage
      t.integer :max
      t.timestamps
    end
  end

end
