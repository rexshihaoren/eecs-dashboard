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

<<<<<<< HEAD
=======
  self.up
    add_column :usages, :max, :integer
  end
>>>>>>> c5a9a57b2a3b5765fb411cda9e13f811c222c6d4
end
